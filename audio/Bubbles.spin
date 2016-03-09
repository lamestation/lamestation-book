CON
    _clkmode = xtal1 + pll16x
    _xinfreq = 5_000_000

OBJ
    audio   : "LameAudio"
    ctrl    : "LameControl"

VAR
    long    volume
    long    volume_inc
    long    volcount
    long    freq

PUB Main
    audio.Start
    ctrl.Start

    volume:= 1
    volume_inc := 1

    audio.SetWaveform(1, audio#_SAW)
    audio.SetEnvelope(1, 0)

    repeat
        ctrl.Update

        if ctrl.Up
            freq++
        if ctrl.Down
            freq--

        audio.SetFrequency(1,freq)

        if ctrl.A
            volume_inc--

            volcount++
            if (volcount // volume_inc) > (volume_inc >> 1)
                volume := 127
            else
                volume := 0

            audio.SetVolume(1,volume)
        else
            volume_inc := 1000
            audio.SetVolume(1,0)
