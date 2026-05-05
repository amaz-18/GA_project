set terminal png tiny size 800,800
set output "synteny.png"
set xtics rotate ( \
 "CP038996.1" 1.0, \
 "CP038997.1" 2796178.0, \
 "" 2919198 \
)
set ytics ( \
 "tig00000004" 1.0, \
 "tig00000001" 14736.0, \
 "*tig00000002" 2789951.0, \
 "*tig00000003" 3008527.0, \
 "tig00000005" 3037413.0, \
 "tig00000007" 3077424.0, \
 "tig00000006" 3093551.0, \
 "tig00000009" 3108571.0, \
 "tig00000011" 3133422.0, \
 "tig00000010" 3140463.0, \
 "" 3155926 \
)
set size 1,1
set grid
unset key
set border 0
set tics scale 0
set xlabel "REF"
set ylabel "QRY"
set format "%.0f"
set mouse format "%.0f"
set mouse mouseformat "[%.0f, %.0f]"
set xrange [1:2919198]
set yrange [1:3155926]
set style line 1  lt 1 lw 3 pt 6 ps 1
set style line 2  lt 3 lw 3 pt 6 ps 1
set style line 3  lt 2 lw 3 pt 6 ps 1
plot \
 "synteny.fplot" title "FWD" w lp ls 1, \
 "synteny.rplot" title "REV" w lp ls 2
