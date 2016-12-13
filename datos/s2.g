#!/usr/bin/gnuplot

set terminal epslatex size 12cm,7cm
set output 'sCH.tex'

set title
set xlabel '$c_M$ (\si{\mol\per\metre\cubed})'
set ylabel '$\sigma$ (\si{\micro\siemens\per\centi\metre})'
set grid x,y
set yrange[0:50]
set xrange[0:1.1]
set key bottom right
set key spacing 4



g(x)=178.05*x-166.39*x**1.5

plot 'data' u 1:5 ps 3 lw 3 title '\ce{CH_3COOH}', (x < 0.45) ? g(x) : 1/0 ls 2 lw 2 title '$\num{178}\cdot x - \num{166} \cdot x^{3/2}$'
set terminal wxt
set output
