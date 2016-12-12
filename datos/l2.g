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

f(x)=0.505/x/x*(sqrt(1+103.13*x*x)-1)+0.137/x/x
g(x)=a*x+b
fit g(x) 'data' u 2:($6*1000) via a,b

#15.5+-1 = b

plot 'data' u 2:($6*1000) ps 3 lw 3 title '\ce{CH_3COOH}', f(x) ls 1 lw 2 title '$(\num{0.5}(\sqrt{1+100\cdot x^2}-1)+\num{1.37})/x^2$', g(x) ls 2 lw 2 title '$\num{15.5}-\num{11.5}\cdot x$'

set terminal wxt
set output
