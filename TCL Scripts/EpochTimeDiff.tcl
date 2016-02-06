#!/bin/sh
# tmp.tcl \
exec tclsh "$0" ${1+"$@"}

puts [set _time2 [clock format 1454106506]]
puts [set _time1 [clock format 1454106410]]
#puts [clock format $_time \ -format %S]
set _t2 1454106506
set _t1 1454106410
puts [expr {[scan $_t2 %s] - [scan $_t1 %s]}]
