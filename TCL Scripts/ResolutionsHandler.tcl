#!/bin/sh
# ResolutionsHandler.tcl \
exec tclsh "$0" ${1+"$@"}

set fhandle [open C:/Work/Automation/autotest/Beehd_Win/test_cases/dres.txt]
set DesiredResolution [string trim [read $fhandle]]
close $fhandle
set fhandle [open C:/Work/Automation/autotest/resources/files/frameResList.txt]
set ResolutionsData {}
foreach line [split [read $fhandle]\n] {
	lappend ResolutionsData $line
}
close $::fhandle
set pass 0
for {set x 0} {$x<([llength $ResolutionsData]-2)} {incr x} { # trick to offset two newlines in Resolutionfile NO GOOD need to trim the string 
	if {[lindex $ResolutionsData $x] == $DesiredResolution} {
		incr pass
		set actRes [lindex $ResolutionsData $x]
	} elseif {[lindex $ResolutionsData $x] > $DesiredResolution} {
		set actRes [lindex $ResolutionsData $x]
		set x [llength $ResolutionsData]
		incr pass -[llength $ResolutionsData]
		break;
	} else {
		set actRes [lindex $ResolutionsData $x]
	}
}
if {$pass>0} {
	set fhandle [open C:/Work/Automation/autotest/resources/files/result.txt "w"]
	puts -nonewline $fhandle "Test OK; Resolution was $DesiredResolution"
} else {
	set fhandle [open C:/Work/Automation/autotest/resources/files/result.txt "w"]
	puts -nonewline $fhandle "Test FAIL; Desired resolution was set to: $DesiredResolution, and actual resolution was: $actRes"
}
close $::fhandle
