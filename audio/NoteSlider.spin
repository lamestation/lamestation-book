CON
    _clkmode = xtal1 + pll16x
    _xinfreq = 5_000_000

OBJ
    audio   : "LameAudio"
    ctrl    : "LameControl"
    fn      : "LameFunctions"

VAR
    long    note

PUB Main
    audio.Start
    ctrl.Start

    note := 24

    audio.SetEnvelope(0,0)
    audio.SetEnvelope(1,0)
    audio.SetEnvelope(2,0)
    audio.SetEnvelope(3,0)

    audio.SetWaveform(0, audio#_SQUARE)
    audio.SetWaveform(1, audio#_SAW)
    audio.SetWaveform(2, audio#_SINE)
    audio.SetWaveform(3, audio#_SINE)

    repeat
        ctrl.Update

        if ctrl.Left
            if note > 0
                note--
        if ctrl.Right
            if note < 150
                note++

        audio.SetNote(0, note)
        audio.SetNote(1, note - 12)
        audio.SetFrequency(2, note << 10)
        audio.SetFrequency(3, note >> 2)

        fn.Sleep(5)
