CON

    _clkmode = xtal1|pll16x
    _xinfreq = 5_000_000
OBJ
    lcd  :               "LameLCD"
    gfx  :               "LameGFX"
    ctrl :               "LameControl"
    fn   :               "LameFunctions"
    box  :               "gfx_box"
    boxo :               "gfx_box_o"
VAR
    byte    x1, y1
    byte    x2, y2

CON
    w = 24
    h = 24
PUB Main
    lcd.Start(gfx.Start)
    x2 := 52
    y2 := 20
    repeat
        gfx.ClearScreen(0)
        ctrl.Update
        if ctrl.Left
            if x1 > 0
                x1--
        if ctrl.Right
            if x1 < gfx#res_x-24
                x1++
        if ctrl.Up
            if y1 > 0
                y1--
        if ctrl.Down
            if y1 < gfx#res_y-24
                y1++
        if fn.TestBoxCollision(x1, y1, w, h, x2, y2, w, h)
            gfx.InvertColor(True)
        gfx.Sprite(boxo.Addr,x1,y1,0)
        gfx.Sprite(boxo.Addr,x2,y2,0)
        gfx.Sprite(box.Addr,x1,y1,0)
        gfx.InvertColor(False)
        lcd.DrawScreen
