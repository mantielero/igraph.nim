# nim --maxLoopIterationsVM:10000000000 -d:futharkRebuild -d:nodeclguards c create
# The next one not working:
# nim --maxLoopIterationsVM:10000000000 c -d:futharkRebuild -d:nodeclguards -d:noopaquetypes create
import futhark,os

# /usr/include/igraph/igraph.h

importc:
  outputPath currentSourcePath.parentDir / "igraph_wrapper.nim"
  path "/usr/include/igraph"
  "igraph.h"
  #"libavutil/channel_layout.h"
  #"libavutil/samplefmt.h"    