CON
    _clkmode        = xtal1 + pll16x
    _xinfreq        = 5_000_000

OBJ
    audio   :   "LameAudio"
    ctrl    :   "LameControl"
    fn      :   "LameFunctions"

VAR
    byte    waveform
    byte    note

PUB Noise
    audio.Start
    ctrl.Start

    waveform := 1
    note := 50

    audio.SetADSR(1,127, 1, 0, 70)
    audio.PlaySound(1,note)

    repeat
        ctrl.Update

        if ctrl.Left
            if waveform > 0
                waveform--
                fn.Sleep(200)
        if ctrl.Right
            if waveform < 5
                waveform++
                fn.Sleep(200)

        if ctrl.Up
            if note < 127
                note++
                fn.Sleep(50)
        if ctrl.Down
            if note > 0
                note--
                fn.Sleep(50)

        audio.SetWaveform(1, waveform)
        audio.PlaySound(1,note)
