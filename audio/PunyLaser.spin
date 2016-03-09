CON
    _clkmode = xtal1 + pll16x
    _xinfreq = 5_000_000

OBJ
    audio   : "LameAudio"
    ctrl    : "LameControl"

VAR
    long    volume
    long    freq

PUB Main
    audio.Start
    ctrl.Start

    audio.SetWaveform(1, audio#_TRIANGLE)
    audio.SetEnvelope(1, 0)

    repeat
        ctrl.Update

        audio.SetFrequency(1,freq)

        if ctrl.A
            if freq > 2000
                freq -= 30
                audio.SetVolume(1,127)
            else
                audio.SetVolume(1,0)
        else
            freq := 40000
            audio.SetVolume(1,0)
