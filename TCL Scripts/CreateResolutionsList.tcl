#!/bin/sh
# Parser.tcl \
exec tclsh "$0" ${1+"$@"}
#
#
#This script will parse the statistics xml and prepare two vectors of media info
#
#
package require tdom


set fhandle [open C:/Work/Automation/autotest/resources/files/statistics.txt]
set file_data [read $fhandle]
close $::fhandle
set fileFrameResList [open C:/Work/Automation/autotest/resources/files/frameResList.txt "a"]
set fileFrameRatList [open C:/Work/Automation/autotest/resources/files/frameRatList.txt "a"]
set doc [dom parse $file_data]
set root [$doc documentElement]
set numOfstreams [$root selectNodes {string(/result/mediaInfo/numOfInfoStreams)}]
#puts $fileID "LOG - Number of streams detected: $numOfstreams"
set reciever {}
set transmitter {}
set frameRateR {}
set frameHeightR {}
set mediatype {audio video PNC}
for {set x 0} {$x<$numOfstreams} {incr x} {


       switch $x {
      
	      0 {
	     
		    #puts [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream0/eCodecType)}]
		    set mediaType [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream0/eMediaType)}]
		    set direction [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream0/eDirection)}]
		    set codecType [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream0/eCodecType)}]
		    set frameH    [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream0/frameHeight)}]
		    set frameR    [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream0/bandwidth)}]
		    #dict set Streams(stream0) codec $codecType
	      }
	      1 {
	     
		    #puts [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream1/eCodecType)}]
		    set mediaType [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream1/eMediaType)}]
		    set direction [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream1/eDirection)}]
		    set codecType [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream1/eCodecType)}]
		    set frameH    [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream1/frameHeight)}]
		    set frameR    [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream1/bandwidth)}]
	      }
	      2 {
			 
		    #puts [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream2/eCodecType)}]
		    set mediaType [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream2/eMediaType)}]
		    set direction [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream2/eDirection)}]
		    set codecType [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream2/eCodecType)}]
		    set frameH    [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream2/frameHeight)}]
		    set frameR    [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream2/bandwidth)}]
	      }
	      3 {
			 
		    #puts [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream3/eCodecType)}]
		    set mediaType [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream3/eMediaType)}]
		    set direction [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream3/eDirection)}]
		    set codecType [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream3/eCodecType)}]
		    set frameH    [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream3/frameHeight)}]
		    set frameR    [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream3/bandwidth)}]
	      }
	      4 {
			 
		    #puts [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream4/eCodecType)}]
		    set mediaType [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream4/eMediaType)}]
		    set direction [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream4/eDirection)}]
		    set codecType [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream4/eCodecType)}]
		    set frameH    [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream4/frameHeight)}]
		    set frameR    [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream4/bandwidth)}]
	      }
	      5 {
					
		    #puts [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream5/eCodecType)}]
		    set mediaType [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream5/eMediaType)}]
		    set direction [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream5/eDirection)}]
		    set codecType [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream5/eCodecType)}]
		    set frameH    [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream5/frameHeight)}]
		    set frameR    [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream5/bandwidth)}]
	      }
	      6 {
						       
			  #puts [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream5/eCodecType)}]
		    set mediaType [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream6/eMediaType)}]
		    set direction [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream6/eDirection)}]
		    set codecType [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream6/eCodecType)}]
		    set frameH    [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream6/frameHeight)}]
		    set frameR    [$root selectNodes {string(/result/mediaInfo/streamsStatsInfo/Stream6/bandwidth)}]
	     }
	     
       } 
       #---------End Switch -------------------------------
 
       if {$direction=="RECEIVER"} {	       
	       if {$mediaType=="AUDIO"} {
				#	       set reciever [linsert $reciever 1 $codecType]
		       } elseif {$mediaType=="VIDEO"} {
				#	       set reciever [linsert $reciever 2 $codecType]
			       } else {
				#	       set reciever [linsert $reciever 3 $codecType]
	       }

       } else {
	       if {$mediaType=="AUDIO"} {
				      #set transmitter [linsert $transmitter 1 $codecType]
			      } elseif {$mediaType=="VIDEO"} {
				     # set transmitter [linsert $transmitter 2 $codecType]
				      puts $fileFrameResList $frameH
				      puts $fileFrameRatList $frameR
			      } else {
				     # set transmitter [linsert $transmitter 3 $codecType]
			      }
	      }
      
}
# -------- End For----------------------


close $::fileFrameRatList
close $::fileFrameResList


exit
