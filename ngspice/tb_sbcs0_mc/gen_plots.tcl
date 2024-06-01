#!/usr/bin/tclsh

proc plot {name fnList xlabel ylabel xrange yrange scale} {
  set fp [open "plots/${name}.gnplot" w]
  puts $fp "set xlabel '$xlabel'"
  puts $fp "set ylabel '$ylabel'"
  puts $fp "set xrange $xrange"
  puts $fp "set yrange $yrange"
  #puts $fp "set format x \"10^{%L}\""
  puts $fp "set grid"
  puts $fp "set key off"
  puts $fp "set term png"
  puts $fp "set output '${name}.png'"
  puts $fp "set datafile separator ','"
  puts $fp "plot \\"
  foreach fn $fnList {
    puts $fp "'../${fn}' using (\$1):(\$2*$scale) with lines lt rgb 'blue',\\"
  }
  close $fp
  cd plots
  exec gnuplot ${name}.gnplot
  cd ..
}

set fnList_io   [lsort -dictionary [glob data/*io.csv*]]
set fnList_psrr [lsort -dictionary [glob data/*psrr.csv*]]

plot io   $fnList_io   "VDD (V)" "Current (uA)" "\[1.0:3.6\]" "\[18:28\]" 1e6 
plot psrr $fnList_psrr "VDD (V)" "PSRR (dB)"    "\[1.0:3.6\]" "\[0:80\] " 1

