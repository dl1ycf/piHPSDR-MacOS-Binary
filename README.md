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

---------------------------------------------------------------------------
cd $HOME/Desktop

chmod 700 install.sh

./install.sh

---------------------------------------------------------------------------

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

Features compiled into the program
==================================

The following features, selectable at compile time, have been activated:

PURESIGNAL
----------
The program can do adaptive pre-distortion both with the old and new protocol

LOCALCW
-------
The program can generate CW from key/paddle attached to the SDR.
If you check "internal" in the CW menu, CW from the key is generated within the SDR.
              
STEMLAB
-------
The program can detect a RedPitaya, start the SDR application through the web
interface, and then start the radio.

MIDI  
----
The program can be controlled by a MIDI console attached to the Macintosh.
I use the Behringer PL-1 and this makes much fun. Instructions for using
MIDI follows.

              
Using MIDI
==========

I refrained from building in a menu to specify the function of each knob or button
of a MIDI controller. This is done by editing a simple text file (you can modify it
with a text editor). For the Behringer CMD PL-1 console, a sample file is present here
under the name midi.inp.
This must be placed in the working directory of piHPSDR, which is in the folder

$HOME  --> Library --> Application Support --> piHPSDR

It is possible that, depending on the MacOS version and the setting of the user skills,
you see no folder named "Library" in your Home folder. In this case you have to place the
midi.inp file on the Desktop, open a terminal window and type in the commands

cd $HOME/Desktop

mv midi.inp "$HOME/Library/Application Support/piHPSDR"

To do so, you should have started piHPSDR at least once, since upon its first invocation
it generates the piHPSDR folder within the "Application Support" folder.


