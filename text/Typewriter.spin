CON

    _clkmode        = xtal1 + pll16x
    _xinfreq        = 5_000_000

OBJ

    lcd      : "LameLCD"
    gfx      : "LameGFX"
    fn       : "LameFunctions"
    audio    : "LameAudio"
    music    : "LameMusic"

    font_6x8 : "gfx_font6x8_normal_w"
    famus    : "gfx_spacegirl"
    blehtrd  : "song_blehtroid"

PUB TypewriterTextDemo | count

    lcd.Start(gfx.Start)

    audio.Start

    music.Start
    music.Load(blehtrd.Addr)
    music.Loop

    gfx.ClearScreen(0)

    gfx.Sprite(famus.Addr,38,0,0)

    lcd.DrawScreen
    fn.Sleep(2000)

    count := 0
    repeat
        Typewriter(string("I FIRST BATTLED THE",10,"DURPEES ON THE PLANET",10,"PHEEBES. IT WAS THERE",10,"THAT I FOILED MY",10,"DINNER AND HAD TO",10,"ASK FOR THE CHECK..."),0,0,128,64, 6, 8, count)
        count++
        fn.Sleep(80)

        lcd.DrawScreen
    while count < 160

PUB Typewriter(stringvar, origin_x, origin_y, w, h, tilesize_x, tilesize_y, countmax) | char, x, y, count

    x := origin_x
    y := origin_y

    count := 0
    repeat strsize(stringvar)
        count++
        char := byte[stringvar++]
        if char == 10 or char == 13
            y += tilesize_y
            x := origin_x
        elseif char == " "
            x += tilesize_x
        else
            gfx.Sprite(font_6x8.Addr, x, y, char - " ")
            if x+tilesize_x => origin_x+w
                y += tilesize_y
                x := origin_x
            else
                x += tilesize_x
        if count > countmax
            return
