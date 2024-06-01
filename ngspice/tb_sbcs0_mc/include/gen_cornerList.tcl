#!/usr/bin/tclsh

proc combine {paramList} {
  proc combine0 {a b} {
    set c {}
    foreach a_ $a {
      foreach b_ $b {lappend c "${a_},${b_}"}
    }
    return $c
  }

  set l [llength $paramList]
  set c [lindex $paramList [expr $l-1]]
  for {set i 0} {$i < [expr $l-1]} {incr i} {
    set a [lindex $paramList [expr $l-$i-2]]
    set b $c
    set c [combine0 $a $b]   
  }
  
  return $c
}

set paramNames {vdd    temp      corner       }
set paramList0 {{3.3}  {25}      {tt}         }
#set paramList1 {{3.3}  {25}      {ss ff sf fs}}

set c0 [combine $paramList0]
#set c1 [combine $paramList1]
#set c "$c0 $c1"
set c "$c0"

set d {}
for {set i 0} {$i < [llength $c]} {incr i} {
  lappend d $i,[lindex $c $i]
}

set header [string map {" " ,} [join $paramNames]]
set header num,$header
set fp [open "cornersList" w]
puts $fp $header
foreach d_ $d {puts $fp $d_}
close $fp

