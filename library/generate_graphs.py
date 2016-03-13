#!/usr/bin/env python

import matplotlib.pyplot as plt
import numpy as np
from scipy import signal
import wave

def print_figure(x, y, name):
    csfont = {'fontname':'Droid Sans'}
    plt.clf()
    plt.plot(x, y)
    
    frame1 = plt.gca()
    frame1.axes.get_xaxis().set_ticklabels([])
    frame1.axes.get_yaxis().set_ticklabels([])
    frame1.axes.set_ylim([-0.6,0.6])
    frame1.axes.set_xlim([0,512])
    
    fig = plt.gcf()
    fig.set_size_inches(6.0, 1.5)
    
    fig.savefig(name, bbox_inches='tight', dpi=72)


def print_sample(filename, name):
    spf = wave.open(filename,'r')
    smp = spf.readframes(-1)
    smp = np.fromstring(smp, 'Int16')

    smn = []
    cnt = 0
    for n in smp:
        if cnt % 4 == 0:
            smn.append(n / 63655.0)
        cnt += 1

    plt.clf()
    plt.plot(smn)
    
    frame1 = plt.gca()
    frame1.axes.get_xaxis().set_ticklabels([])
    frame1.axes.get_yaxis().set_ticklabels([])
    frame1.axes.set_ylim([-0.6,0.6])
    frame1.axes.set_xlim([0,512])
    
    fig = plt.gcf()
    fig.set_size_inches(6.0, 1.5)
    
    fig.savefig(name, bbox_inches='tight', dpi=72)


sample = 512.0
x = np.arange(sample)

# square
y = signal.square(2.0 * np.pi * x / sample) / 2.0
print_figure(x, y, '0_square.png')

# saw
y = (x - 128.0) % (sample / 2.0) / (sample / 2.0) - 0.5
print_figure(x, y, '1_saw.png')

# triangle
y = abs( (x * 2.0 - 128.0) % (sample) / (sample) - 0.5) * 2.0 - 0.5
print_figure(x, y, '2_triangle.png')

# sine
y = np.sin(2.0 * np.pi * x / sample) / 2.0
print_figure(x, y, '3_sine.png')

# noise 
y = np.random.normal(0, 1, sample) % 1.0 - 0.5
print_figure(x, y, '4_noise.png')

# sample
print_sample('pipeorgan.wav', '5_sample.png')
