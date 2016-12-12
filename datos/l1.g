#!/usr/bin/gnuplot

set terminal epslatex size 12cm,7cm
set output 'lCl.tex'

set title
set xlabel '$\sqrt{c_M}$ ($(\si{\mol\per\metre\cubed})^{1/2}$)'
set ylabel '$\Lambda$ (\si{\milli\siemens\metre\squared\per\mol})'
set grid x,y
set yrange[35:40]
set xrange[0:1.1]
set key bottom left
set key spacing 4

f(x)=a
fit f(x) 'data' u 2:($4*1000) via a

g(x)=c*x+d
set xrange[0:0.8]
fit g(x) 'data' u 2:($4*1000) via c,d

set xrange[0:1.1]


plot 'data' u 2:($4*1000) ps 3 lw 3 title '\ce{HCl}', f(x) ls 1 lw 2 title '\num{37.4}', g(x) ls 2 lw 2 title '$\num{38.4}-\num{2.12}\cdot x$'


pr a
pr c
pr d
set terminal wxt
set output
