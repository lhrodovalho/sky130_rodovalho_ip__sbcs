#!/usr/bin/tclsh

set fniList [glob data/*.dat*]
foreach fni $fniList {
  set fpi [open "$fni" r]
  set lines [read -nonewline $fpi]
  set lines [split $lines "\n"]
  close $fpi

  set fn  [lindex [split $fni '.'] 0]
  set num [lindex [split $fni '.'] 1]
  set num [regexp -all -inline -- {[0-9]+} $num]
  set fno "${fn}.csv${num}"

  set fpo [open "$fno" w]
  foreach line $lines {
    set line [regexp -all -inline {\S+} $line]
    set line [string map {" " ","} $line]
    puts $fpo $line
  }
  close $fpo
}

