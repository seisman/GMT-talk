#!/bin/bash
gmt psxy -R0/100/0/10 -JX3i/1.5i -Bag -BWSne+gsnow -Wthick,blue,- -P -K sqrt.d > GMT_JX_linear.ps
gmt psxy -R -J -St0.1i -N -Gred -Wfaint -O sqrt.d10 >> GMT_JX_linear.ps
rm gmt.*
