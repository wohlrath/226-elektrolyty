#!/usr/bin/gnuplot

set terminal epslatex size 12cm,7cm
set output 'sCl.tex'

set title
set xlabel '$c_M$ (\si{\mol\per\metre\cubed})'
set ylabel '$\sigma$ (\si{\micro\siemens\per\centi\metre})'
set grid x,y
set yrange[0:400]
set xrange[0:1.1]
set key bottom right
set key spacing 4

f(x)=a*x
fit f(x) 'data' u 1:3 via a

g(x)=384*x-21.2*x**1.5

plot 'data' u 1:3 ps 3 lw 3 title '\ce{HCl}', f(x) ls 1 lw 2 title '$375\cdot x$', g(x) ls 2 lw 2 title '$384\cdot x-\num{21.2} \cdot x^{1.5}$'

set terminal wxt
set output
