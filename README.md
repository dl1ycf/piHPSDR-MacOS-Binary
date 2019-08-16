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

Initialize the Homebrew Universe and Install GTK3 libraries
===========================================================

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
"homebrew" universe and installs the gtk+3 package (and 
all those it dependds on) which
is needed for running piHPSDR. NOTE: you will be asked
the "admin" password once. If then, a window from the
keychain appears, you can safely answer "do not allow".
For your convenience, the contents of the file "install.sh" are
documented here:

------------------------------------------------------------------------------------------------------
#!/bin/sh
  
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install gtk+3

------------------------------------------------------------------------------------------------------

Download piHPSDR application
============================

A MacOS application bundle has a well-defined directory structure. For the ease of installation,
the application is compressed (ZIP file). If you download and decompress it, you should have
a working MacOS application file with name "pihpsdr.app" and the HPSDR logo as the icon.
Double-clicking it starts it.




