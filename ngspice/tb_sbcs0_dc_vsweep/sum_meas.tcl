#!/usr/bin/tclsh

set sum_fp [open "./meas/meas.csv" w]

set measFileList [lsort -dictionary [glob ./meas/*.meas*]]
set fp [open [lindex $measFileList 0]]
set header [lindex [read "$fp"] 0]
close $fp

puts $sum_fp "$header"

foreach measFile $measFileList {
  set fp [open $measFile r]
  set meas [read $fp]
  close $fp
  set meas [lindex $meas 1]
  puts $sum_fp "$meas"
}
close $sum_fp

