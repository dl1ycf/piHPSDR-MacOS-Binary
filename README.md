# piHPSDR-MacOS-Binary

Here I provide a "click-able" MacOS app file for piHPSDR.
It is compiled+linked under MacOS 10.13 "High Sierra" and
tested both under MacOS 10.13 and MacOS 10.14 "Mojave".

Unfortunately, it is quite difficult to provide a
fully self-contained MacOS app-file for a GTK-based program.

Therefore the piHPSDR app-file is bundled with many of the
required libraries such as fftw, WDSP, portaudio etc., but
needs a working GTK installation in /usr/local.

This is not so difficult, and has been tested by somebody
completely oblivious to MacOS and UNIX programming, so
everybody can do it. I have built this file within the
"homebrew" universe, so I give instructions how to
initialize "homebrew" and install the parts required for
running piHPSDR.

Step 1: init homebrew
======================

Get the file "install.sh" and place it on the Desktop
of your Mac OS. Then, open the "terminal" app. If you
have never used it, it is in the folder
/Applications/Utilities. In the terminal window that
opens, type the commands

cd $HOME/Desktop
chmod 700 install.sh
./install.sh

This should execute a handful of commands I have put
into the file install.sh. It initializes the
"homebrew" universe and installs the gtk+3 package which
is needed for running piHPSDR.


