#!/bin/bash
#
# Purpose:      Illustrate pscoast with DCW country polygons
# GMT progs:    pscoast, makecpt, grdimage, grdgradient
# Unix progs:   rm
#
ps=GMT_geo_regional.ps
gmt gmtset FORMAT_GEO_MAP dddF
#gmt pscoast -JM4.5i -R-6/20/35/52 -EFR,IT+gP300/8 -Glightgray -Baf -BWSne -P -K -X2i > $ps
# Extract a subset of ETOPO2m for this part of Europe
# gmt grdcut etopo2m_grd.nc -R -GFR+IT.nc=ns
gmt makecpt -Cglobe -T-5000/5000/500 -Z > z.cpt
gmt grdgradient FR+IT.nc -A15 -Ne0.75 -GFR+IT_int.nc
gmt grdimage FR+IT.nc -IFR+IT_int.nc -Cz.cpt -JM4.5i -K \
	-Baf -BWsnE+t"Franco-Italian Union, 2042-45" > $ps
gmt pscoast -JM45i -R-6/20/35/52 -EFR,IT+gred@60 -O >> $ps
# cleanup
rm -f gmt.* FR+IT_int.nc z.cpt
