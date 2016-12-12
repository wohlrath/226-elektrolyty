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

a=1
b=1
f(x)=a*(sqrt(1+b*x)-1)+1.37
fit f(x) 'data' u 1:5 via a,b

g(x)=155*x-115*x**1.5

plot 'data' u 1:5 ps 3 lw 3 title '\ce{CH_3COOH}', f(x) ls 1 lw 2 title '$\num{5}\cdot (\sqrt{1+100\cdot x}-1)+\num{1.37}$', g(x) ls 2 lw 2 title '$\num{155}\cdot x - \num{115} \cdot x^{3/2}$'
set terminal wxt
set output
