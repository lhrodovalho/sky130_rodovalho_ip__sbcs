#!/usr/bin/tclsh

set fn [glob include/*.sp]
set fn [lindex [split $fn .] 0]
set fn [lindex [split $fn /] 1]

set fp [open "./include/${fn}.sp" r]
set spice [read $fp]
close $fp

set fp [open "./include/cornersList" r]
set cornerFile [read -nonewline $fp]
close $fp

#  Process data file
set table  [split $cornerFile "\n"]
set header [lindex $table 0]
set rows   [lrange $table 1 end]

set header_ [split $header  ","]
set cornerLabels [lrange $header_ 0 end]
puts ">>> cornerLabels $cornerLabels"
foreach row $rows {
     lappend cornerList [split $row ","]
}
puts ">>> cornerList $cornerList"

foreach element $cornerList {  
  set tmp $spice
  set cornerNum [lindex $element 0]
  set cornerValues [lrange $element 0 end]
  puts ">>> cornerLabels $cornerLabels"
  puts ">>> cornerValues $cornerValues"
  for {set i 0} {$i < [llength $cornerLabels]} {incr i} {
    set label [lindex $cornerLabels $i]
    set value [lindex $cornerValues $i]
    #set label_ "#$label"
    set tmp [string map "#$label $value" $tmp]
  }
  set tmp [string map "#tb $fn" $tmp]

  set fp [open "./spice/${fn}.sp${cornerNum}" w]
  puts $fp $tmp
  close $fp
}
