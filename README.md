# piHPSDR-MacOS-Binary

Here I provide a "click-able" MacOS app file for piHPSDR.
It is compiled+linked under MacOS 10.15 "Catalina" and
has been tested there. 

This is the new piHPSDR 2 near-final version.

Since it is next-to-impossible to provide a really
self-contained app bundle for GTK applications, we
only include "own" libraries (WDSP and SoapySDR) in the
app bundle, and require that all other libraries are
installed by the user in the default location.

This is done automatically by the "install.sh" shell script.
It initializes the "homebrew" universe and installs exactly
those "homebrew" packages needed to run piHPSDR.

Then the program works but is not able to connect to
devices through the SoapySDR layer. To this end, the SoaypSDR
modules must be installed in /usr/local/lib. The files are
contained in the file soapy.tar.

Initialize the Homebrew Universe and install libraries
============================================= ========

Get the file "install.sh" and place it on the Desktop
of your Mac OS. Then, open the "terminal" app. If you
have never used it, it is in the folder
/Applications/Utilities. In the terminal window that
opens, type the commands betwen the dahes lines:

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

The install.sh shell scripts simply initializes the "homebrew"
universe and then installs packages needed for pihpsdr.
NOTE: you will be asked
the "admin" password once. If then, a window from the
keychain appears, you can safely answer "do not allow".

What if "homebrew" is already installed but not GTK?
=====================================================

In this case, you can still execute the "install.sh" script
and this does no harm.

What if an existing "homebrew" installation is corrupt?
=======================================================

The feedback I got from users at least in one case indicates that
there was a "homebrew" installation that was somehow inconsistent,
and could not be fixed with "brew update", "brew upgrade",
"brew link" and similar commands. In this case, I recommend saving
the old "brew universe" and doing a fresh install. As a first step,
save whatever is contained in the /usr/local directory to a backup.
Then, issue the command "brew list" to get a list of installed
packages and save this list to a file on the Desktop.
Then, remove /usr/local completely and invoke the install.sh
script (installing the command line tools via xcode-select should not
be necessary if you already had a running "homebrew universe". On the
other hand, issuing this command does no harm if the command line
tools are already there).

After this, pihpsdr should be able to run. If this succeeds, you can
load any packages that you need and that were in your previous 
homebrew universe by "brew install" commands (you have saved the list of
packages installed previously in a file on the Desktop). You also can
(should) copy any non-homebrew file that were in your old /usr/local from your backup
to your new /usr/local.

Download piHPSDR application
============================

A MacOS application bundle has a well-defined directory structure.
For the ease of installation, this bundle has been packed into a single
"tar" file named pihpsdr.app.tar. Download this file to your Desktop,
open a terminal window and type in the commands between the dashed lines:

---------------------------------------------------------------------------
cd $HOME/Desktop
tar xf pihpsdr.app.tar
---------------------------------------------------------------------------

Download and install SoapySDR modules
=====================================
If you only want to use piHPSDR with HPSDR radios, you can skip this step.
However, to play with SDR radios connected by the SoapySDR layer (for
example: LimeSDR, Adalm Pluto, RTL sticks) you need some SoapySDR support
files. To install these, download the file soapy.tar to the Desktop,
open a terminal window and type the commands between the dashed lines:

---------------------------------------------------------------------------
cd $HOME/Desktop
tar xfP soapy.tar
---------------------------------------------------------------------------



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
              
STEMLAB without AVAHI
---------------------
The program can detect a RedPitaya, start the SDR application through the web
interface, and then start the radio. You need to type in the IP address of the
RedPitaya once (it is remembered), so the best is to give the RedPitaya a
fixed IP address.

MIDI  
----
The program can be controlled by a MIDI console attached to the Macintosh.
I use the Behringer PL-1 and this makes much fun. Meanwhile this has also
been tested with a Behringer Studio2a and with a Hercules DJcompact console.
The MIDI documentation can be found in the github.com/dl1ycf/piHPSDR repository
with the sub-directory release/pihpsdr.

SOAPYSDR
--------
Ability to use SDR hardware connected via the SoapySDR lib. I have tested this
with the Adalm Pluto connected via an USB cable to the Macintosh.
