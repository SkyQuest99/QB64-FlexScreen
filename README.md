# QB64-FlexsScreen

A library that allows your programs to be resized

# Features

Can keep screen size and expand, or not resize

* resizeStretch$ = "KEEP" or resizeStretch$ = "EXPAND"
* resize% = 1(true), 0(false)
* to add a limit use resizeLimitX% = 0 and resizeLimitY% = 0

Built in mouse coordinates support(mouseX%, mouseY%)

Also has a input function names fsInput

# USEAGE

Add your code to the top of screen above *'$include:'FlexScreen.bi'*

Add the initialize or setup in a procedure named setup

Add your code in a procedure named display

* Works on windows 10, other operating systems not sure
