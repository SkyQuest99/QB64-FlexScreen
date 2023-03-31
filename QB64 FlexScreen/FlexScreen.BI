
' activates resize
$RESIZE:ON

'Images that will be used for handling program (s& for the window, oldS& for old window, oDisplay& for the screen)
DIM SHARED s&, oldS&, oDisplay&

' when endProgram is set to 1, program ends
' textInput$ for the fsInput function
DIM SHARED endProgram%, textInput$

' stores mouse positions, also supports stretch
DIM SHARED mi, mb, mouseX%, mouseY%

' fps is the _LIMIT fps% , and some more variables
DIM SHARED fps%, resize%, resizeLimit%, resizeStretch$
DIM SHARED resizeLimitX%, resizeLimitY%
DIM SHARED aspectRatio, scaledWidth, scaledHeight, xPos, yPos, boxWidth, boxHeight

CALL program

'----------------------------------
