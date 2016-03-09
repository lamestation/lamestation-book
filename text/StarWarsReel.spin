CON
    _clkmode = xtal1 + pll16x
    _xinfreq = 5_000_000

OBJ
    lcd      :  "LameLCD"
    gfx      :  "LameGFX"
    txt      :  "LameText"
    audio    :  "LameAudio"
    music    :  "LameMusic"

    font_6x8 : "gfx_font6x8_normal_w"
    song     : "song_ibelieve"

PUB Main

    lcd.Start(gfx.Start)
    lcd.SetFrameLimit(lcd#QUARTERSPEED)

    txt.Load(font_6x8.Addr, " ", 0, 0)

    audio.Start
    music.Start
    music.Load(song.Addr)
    music.Loop

    repeat
        StarWarsReel(@inaworld,120)
        StarWarsReel(@imagine,120)
        StarWarsReel(@takeyour,120)
        StarWarsReel(@somuch,120)

PUB StarWarsReel(text,reeltime) | x

    repeat x from 0 to reeltime
        gfx.ClearScreen(0)
        txt.Box(text, 16, 64-x, 96, 64)
        lcd.DrawScreen

DAT

inaworld    byte    "In a world",10,"of awesome game",10,"consoles...",10,10,10,"One console",10,"dares to be...",0
imagine     byte    "Imagine...",10,10,"A game console",10,"where the rules",10,"of business do",10,"not apply.",0
takeyour    byte    "Take your memory",10,10,"Take your specs!",10,10,"Don't need 'em!",0
somuch      byte    "The most action-packed 32 kilo-",10,"bytes you'll",10,"ever have!",0
