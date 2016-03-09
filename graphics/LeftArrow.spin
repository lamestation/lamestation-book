OBJ
    lcd : "LameLCD"
    gfx : "LameGFX"
OBJ
    cap : "ScreenCapture"
VAR
    word buffer

PUB Main
    lcd.Start(buffer := gfx.Start)    
    gfx.Sprite(@data, 0,0, 0)
    lcd.DrawScreen
    cap.Capture(buffer)

DAT

data
word    0
word    8, 8
word    %%11000000
word    %%11110000
word    %%11111100
word    %%11111111
word    %%11111111
word    %%11111100
word    %%11110000
word    %%11000000
