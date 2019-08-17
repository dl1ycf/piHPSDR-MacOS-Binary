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

xcode-select --install

chmod 700 install.sh

./install.sh

---------------------------------------------------------------------------

The "xcode-select" command is likely to be necessary if you are usually
*not* doing UNIX-type programming on your Mac. It should install the
"command-line tools", a collection of 
commands such as C compilers and support programs that seemingly are
necessary to install "homebrew". It is not necessary to have the XCode
application, so if you are asked whether you want to install the command
line tools (only) or get the XCode application you opt for the former.

The install.sh shell scripts executes only two commands that
initialize the
"homebrew" universe and install the gtk+3 package (and 
all those it depends on) which
is needed for running piHPSDR. NOTE: you will be asked
the "admin" password once. If then, a window from the
keychain appears, you can safely answer "do not allow".

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
The program is compiled such that a CW key/paddle connected to the radio
can be used both for "internal" and "local" CW. Internal CW is selected
by checking the "internal" box in the CW menu. In this case, the FPGA
in the radio generates both the CW RF signal and the CW side tone.
If you un-check the "internal" button, CW and sidetone is generated
within piHPSDR. Normally "internal" CW is to be preferred, but if
you need the CW side tone on the local MacOS audio (for example, from
the built-in speakers of your Mac) then you must use local CW since
"internal" CW will generate a sidetone only at the headphone jacket
of your radio.
              
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


