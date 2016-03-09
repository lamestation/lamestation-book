CON
    _clkmode = xtal1 + pll16x
    _xinfreq = 5_000_000

OBJ
    audio   : "LameAudio"
    music   : "LameMusic"
    fn      : "LameFunctions"

    song    : "song_pixeltheme"
    song2   : "song_lastboss"

PUB Play
    audio.Start
    music.Start

    music.Load(song.Addr)
    music.Loop

    fn.Sleep(2000)

    music.Stop
    music.Load(song2.Addr)
    music.Loop

    fn.Sleep(2000)

    music.Stop
    music.Load(song.Addr)
    music.Play

    repeat until not music.IsPlaying

    music.Load(song2.Addr)
    music.Play
