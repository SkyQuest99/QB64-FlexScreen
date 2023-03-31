
OPTION _EXPLICIT
OPTION _EXPLICITARRAY
_TITLE "Untitiled"

'$include:'FlexScreen.bi'

SUB setup
    s& = _NEWIMAGE(300, 300, 32)
    oDisplay& = _NEWIMAGE(_WIDTH(s&), _HEIGHT(s&), 32)
    SCREEN s&

    fps% = 30
    resize% = 1
    resizeStretch$ = "KEEP"
    resizeLimit% = 1
    resizeLimitX% = 0
    resizeLimitY% = 0

    PRINT "BOOTING UP"
END SUB

SUB display

    LINE (0, 0)-(700 - 0, 300 - 0), _RGB32(0, 50, 0), BF
    LOCATE 1, 3: PRINT mouseX%; mouseY%

    IF mouseX% <> -1 OR mouseY% <> -1 THEN
        LINE (mouseX% - 10, mouseY% - 10)-(mouseX% + 10, mouseY% + 10), _RGB32(0, 0, 0), BF
    END IF

    LOCATE 5, 1: PRINT "Hello world"

END SUB

SUB finished
    PRINT "BOOTING DOWN"
END SUB

'$include:'FlexScreen.bm'

