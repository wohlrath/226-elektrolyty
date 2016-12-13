#!/usr/bin/gnuplot

set terminal epslatex size 12cm,7cm
set output 'lCH.tex'

set title
set xlabel '$\sqrt{c_M}$ ($(\si{\mol\per\metre\cubed})^{1/2}$)'
set ylabel '$\Lambda$ (\si{\milli\siemens\metre\squared\per\mol})'
set grid x,y
set yrange[0:20]
set xrange[0:1.1]
set key top right
set key spacing 4


set xrange[0:0.7]

g(x)=a*x+b
fit g(x) 'data' u 2:($6*1000) via a,b

set xrange[0:1.1]


#17.8+-0.5 = b

plot 'data' u 2:($6*1000) ps 3 lw 3 title '\ce{CH_3COOH}', (x<0.7) ? g(x) : 1/0 ls 2 lw 2 title '$\num{17.8}-\num{16.6}\cdot x$'

set terminal wxt
set output
