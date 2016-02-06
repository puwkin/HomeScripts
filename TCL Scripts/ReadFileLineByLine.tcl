#!/bin/sh
# Parser.tcl \
exec tclsh "$0" ${1+"$@"}
#
#
#This script will parse the statistics xml and prepare two vectors of media info
#
#
package require tdom


#proc getMinListLen {list1 list2} {
#	set a [llength $list1]
#	set b [llength $list2]
#	if  {$a>$b} {
#		return $b
#	} elseif {$a<$b} {
#		return $a
#	} else {
#	
#		return $a
#	}
#}
 
set fhandle [open statistics.txt]
set file_data [read $fhandle]
close $::fhandle
set result {}
set data [split $file_data \n]
foreach line $data {
       lappend result $line
#      puts $line
}
set list_len [llength $result]
#puts $list_len
foreach line $result {
       #puts $line
       #puts \n
	
}
 
set fileID [open result.txt  "w"]
set doc [dom parse $file_data]
set root [$doc documentElement]
set numOfstreams [$root selectNodes {string(/result/mediaInfo/numOfInfoStreams)}]
puts $fileID "LOG - Number of streams detected: $numOfstreams"
set reciever {}
set transmitter {}
set mediatype {audio video PNC}
#set mediatypeR {}
#set mediatypeT {}
#array set Streams list{
#	stream0{media 0 direct 0 codec 0 band 0}
#	stream1{media 0 direct 0 codec 0 band 0}
#	stream2{media 0 direct 0 codec 0 band 0}
#	stream3{media 0 direct 0 codec 0 band 0}
#	stream4{media 0 direct 0 codec 0 band 0}
#}
for {set x 0} {$x<$numOfstreams} {incr x} {
#      format %c $x
#      set str Stream
#      #append  str $x
#      # string $str
#      puts $str
#      #set p
#      #concat $str {0}
#      set path
#      puts [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream[@]/eCodecType)}]

       switch $x {
      
	      0 {
	     
		    #puts [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream0/eCodecType)}]
		    set mediaType [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream0/eMediaType)}]
		    set direction [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream0/eDirection)}]
		    set codecType [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream0/eCodecType)}]
		    #dict set Streams(stream0) codec $codecType
	      }
	      1 {
	     
		    #puts [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream1/eCodecType)}]
		    set mediaType [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream1/eMediaType)}]
		    set direction [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream1/eDirection)}]
		    set codecType [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream1/eCodecType)}]
	      }
	      2 {
			 
		    #puts [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream2/eCodecType)}]
		    set mediaType [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream2/eMediaType)}]
		    set direction [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream2/eDirection)}]
		    set codecType [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream2/eCodecType)}]
	      }
	      3 {
			 
		    #puts [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream3/eCodecType)}]
		    set mediaType [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream3/eMediaType)}]
		    set direction [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream3/eDirection)}]
		    set codecType [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream3/eCodecType)}]
	      }
	      4 {
			 
		    #puts [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream4/eCodecType)}]
		    set mediaType [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream4/eMediaType)}]
		    set direction [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream4/eDirection)}]
		    set codecType [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream4/eCodecType)}]
	      }
	      5 {
					
		    #puts [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream5/eCodecType)}]
		    set mediaType [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream5/eMediaType)}]
		    set direction [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream5/eDirection)}]
		    set codecType [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream5/eCodecType)}]
	      }
	      6 {
						       
	      	    #puts [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream5/eCodecType)}]
		    set mediaType [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream6/eMediaType)}]
		    set direction [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream6/eDirection)}]
	            set codecType [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream6/eCodecType)}]
	     }
	     
       } 
       #---------End Switch -------------------------------
       #puts $direction
       if {$direction=="RECEIVER"} {
	      #lappend mediatype $mediaType
	      #lappend reciever $codecType
	       #switch $mediaType {
		#       AUDIO {
		#	   set reciever [linsert $reciever 1 $codecType]
		 #      }
		 #      VIDEO {
		#	   set reciever [linsert $reciever 2 $codecType]
		 #      }
		  #     VIDEO PNC {
		#	   set reciever [linsert $reciever 3 $codecType]
		  #     }
	      # }
	       
	       if {$mediaType=="AUDIO"} {
	       				set reciever [linsert $reciever 1 $codecType]
		       } elseif {$mediaType=="VIDEO"} {
		       			set reciever [linsert $reciever 2 $codecType]
		       	} else {
	       				set reciever [linsert $reciever 3 $codecType]
	       }

       } else {
	     # lappend mediatype $mediaType
	     # lappend transmitter $codecType
	       if {$mediaType=="AUDIO"} {
				      set transmitter [linsert $transmitter 1 $codecType]
			      } elseif {$mediaType=="VIDEO"} {
				      set transmitter [linsert $transmitter 2 $codecType]
			      } else {
				      set transmitter [linsert $transmitter 3 $codecType]
			      }
	      }
      
}
# -------- End For----------------------
puts "Going to print RECEIVER: "
#puts $mediatype
puts $reciever
puts "Going to print TRANSMITTER: "
#puts $mediatype
puts $transmitter


set a [llength $reciever]
puts $fileID "LOG - Len of a: $a"
set b [llength $transmitter]
puts $fileID "LOG - Len of b $b"
if  {$a>$b} {
	set min $b
} elseif {$a<$b} {
	set min $a
} else {
	set min $a
	
}
puts $fileID $min
#set min [getMinListLen $reciever $transmitter]

set pass 0
puts $fileID "LOG - Before for"
for {set x 0} {$x<$min} {incr x} {
	puts $fileID "LOG - In for"
	if {[lindex $reciever $x]==[lindex $transmitter $x]} {
	
		puts "The same  [lindex $reciever $x] [lindex $mediatype $x] on both incoming and outgoing streams"
		puts $fileID "The same  [lindex $reciever $x]  on both incoming and outgoing streams"
		incr pass
	} else {
	
		puts "The [lindex $mediaType $x] codec [lindex $reciever $x] at receiver did NOT match the [lindex $mediaType $x] codec [lindex $transmitter $x] at transmitter"
		puts $fileID "The [lindex $mediaType $x] codec [lindex $reciever $x] at receiver did NOT match the [lindex $mediaType $x] codec [lindex $transmitter $x] at transmitter"
		incr pass -1
	}
}

if {$pass>0} {
	puts "Result: PASS"
	puts $fileID "Result: PASS"
} else {
	puts "Result: FAIL"
	puts $fileID "Result: FAIL"
}


close $::fileID


exit
