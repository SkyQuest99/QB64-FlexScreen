
OPTION _EXPLICIT

$RESIZE:ON
_TITLE "FLEXSCREEN"

DIM SHARED resizeType$, resizeLimitX%, resizeLimitY%
DIM SHARED s&, oldS&, graphics&, mi, mouseX%, mouseY%
DIM SHARED endProgram%, aspectRatio, scaledWidth, scaledHeight, xPos, yPos, boxWidth, boxHeight
'----------------------------------

CALL program

_FREEIMAGE graphics&

END

SUB setup
    s& = _NEWIMAGE(300, 300, 32)
    graphics& = _NEWIMAGE(300, 300, 32)
    SCREEN s&
    resizeType$ = "KEEP"

    resizeLimitX% = 300
    resizeLimitY% = 300

    PRINT "BOOTING UP"
END SUB

SUB main
    LINE (0, 0)-(300, 300), _RGB32(255, 255, 255), BF

    IF _KEYDOWN(87) THEN
        PRINT "sus"
        endProgram% = 1
    END IF

    PRINT _RESIZEWIDTH, _RESIZEHEIGHT
    PRINT mouseX%, mouseY%
END SUB

'----------------------------------
SUB program
    CALL setup
    SLEEP 1
    DO
        IF _RESIZEHEIGHT > 0 AND _RESIZEWIDTH > 0 THEN
            oldS& = s&
            s& = _NEWIMAGE(_RESIZEWIDTH, _RESIZEHEIGHT)
            SCREEN s&
            _FREEIMAGE oldS&
        END IF

        IF _WIDTH > 0 AND _HEIGHT > 0 THEN
            IF _WIDTH(s&) < resizeLimitX% OR _HEIGHT(s&) < resizeLimitY% THEN
                _RESIZE OFF
                oldS& = s&
                s& = _NEWIMAGE(resizeLimitX%, resizeLimitY%, 32)
                SCREEN s&
                _FREEIMAGE oldS&
            ELSE
                _RESIZE ON
            END IF
        END IF

        WHILE _MOUSEINPUT
        WEND
        mi = _MOUSEINPUT
        mouseX% = _MOUSEX
        mouseY% = _MOUSEY

        IF resizeType$ = "KEEP" THEN
            boxWidth = _WIDTH(graphics&)
            boxHeight = _HEIGHT(graphics&)
            aspectRatio = boxWidth / boxHeight
            IF aspectRatio > _WIDTH / _HEIGHT THEN
                ' Image is wider than the screen
                scaledWidth = _WIDTH
                scaledHeight = scaledWidth / aspectRatio
            ELSE
                ' Image is taller than or has same aspect ratio as the screen
                scaledHeight = _HEIGHT
                scaledWidth = scaledHeight * aspectRatio
            END IF
            xPos = (_WIDTH - scaledWidth) / 2
            yPos = (_HEIGHT - scaledHeight) / 2

            mouseX% = mouseX% - xPos
            mouseY% = mouseY% - yPos
            IF mouseX% < 0 OR mouseX% >= scaledWidth OR mouseY% < 0 OR mouseY% >= scaledHeight THEN
                ' Mouse is outside the scaled image
                mouseX% = -1
                mouseY% = -1
            ELSE
                mouseX% = INT((mouseX% / scaledWidth) * boxWidth) + 1
                mouseY% = INT((mouseY% / scaledHeight) * boxHeight) + 1
            END IF

            _PUTIMAGE (xPos, yPos)-(xPos + scaledWidth, yPos + scaledHeight), graphics&
        ELSEIF resizeType$ = "EXPAND" THEN
            mouseX% = INT((mouseX% / _WIDTH(s&)) * _WIDTH(graphics&))
            mouseY% = INT((mouseY% / _HEIGHT(s&)) * _HEIGHT(graphics&))
            _PUTIMAGE (0, 0)-(_WIDTH, _HEIGHT), graphics&
        END IF

        _DEST graphics&
        _SOURCE graphics&
        CLS
        CALL main
        _SOURCE 0
        _DEST 0

        _LIMIT 60
        _DISPLAY
    LOOP UNTIL endProgram% = 1
    SYSTEM
END SUB


