# piHPSDR-MacOS-Binary

Here I provide a "click-able" MacOS app file for piHPSDR.
It is compiled+linked under MacOS 10.13 "High Sierra" and
tested both under MacOS 10.13 and MacOS 10.14 "Mojave".

Unfortunately, it is quite difficult to provide a
fully self-contained MacOS app-file for a GTK-based program.

Therefore the piHPSDR app-file is bundled with many of the
required libraries such as fftw, WDSP, portaudio etc., but
needs a working GTK installation in /usr/local.

