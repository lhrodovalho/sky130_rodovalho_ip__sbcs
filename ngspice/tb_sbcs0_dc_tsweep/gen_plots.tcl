#!/usr/bin/tclsh

proc plot {name fnList xlabel ylabel} {
  set fp [open "plots/${name}.gnplot" w]
  puts $fp "set xlabel '$xlabel'"
  puts $fp "set ylabel '$ylabel'"
  puts $fp "set xrange \[-55:125\]"
  #puts $fp "set yrange \[20:24\]"
  #puts $fp "set format x \"10^{%L}\""
  puts $fp "set grid"
  puts $fp "set key off"
  puts $fp "set term png"
  puts $fp "set output '${name}.png'"
  puts $fp "set datafile separator ','"
  puts $fp "plot \\"
  foreach fn $fnList {
    puts $fp "'../${fn}' using (\$1):(\$2*1e6) with lines lt rgb 'blue',\\"
  }
  close $fp
  cd plots
  exec gnuplot ${name}.gnplot
  cd ..
}

set fnList_io   [lsort -dictionary [glob data/*io.csv*]]

plot io   $fnList_io   "Temperature (°C)" "Current (uA)"

