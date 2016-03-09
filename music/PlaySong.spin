CON
    _clkmode = xtal1 + pll16x
    _xinfreq = 5_000_000

OBJ
    audio   : "LameAudio"
    music   : "LameMusic"

    song    : "song_zeroforce"

PUB Main
    audio.Start
    music.Start
    music.Load(song.Addr)
    music.Loop
