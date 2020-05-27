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

Install all prerequisites etc.
==============================

As a prerequisite, download the three files

install.sh
pihpsdr.app.tar
soapy.tar

and put them on your Desktop. Depending on your browser,
these file may additionally be extracted (then you have
a pihpsdr app bundle and a folder named "usr" on your
Desktop), these you can delete.

All the initialization etc. is then done by the shell
script "install.sh". To run it, proceed as follows:

Open the "terminal" app. If you have never used it, it is in the folder
/Applications/Utilities. In the terminal window that opens, type in the following
commands:

---------------------------------------------------------------------------
cd $HOME/Desktop
chmod 700 install.sh
./install.sh
---------------------------------------------------------------------------

Note again, this procedure requires that the files "pihpsdr.app.tar" and "soapy.tar"
have been down-loaded and put on the Desktop. In the file install.sh there are
some comments on what is done there, if you want to know. Besides installing
the "homebrew" universe and the required "homebrew" packages, the file containing
the app bundle (pihpsdr.app.tar) and the file containing the SoapySDR support files
(soapy.tar) are extracted.

NOTE: you will be asked the "admin" password once. If then, a window from the
keychain appears, you can safely answer "do not allow".


What if "homebrew" is already installed?
=======================================

In this case, you should still execute the "install.sh" script.
Existing homebrew packages that you might use are not deleted,
but possibly some new ones are installed.

What if an existing "homebrew" installation is corrupt?
=======================================================

THIS CASE SHOULD OCCUR ONLY VERY RARELY:
The feedback I got from users at least in one case indicates that
there was a "homebrew" installation that was somehow inconsistent,
and could not be fixed with "brew update", "brew upgrade",
"brew link" and similar commands. In this case, I recommend saving
the old "brew universe" and doing a fresh install. As a first step,
save whatever is contained in the /usr/local directory to a backup.
Then, issue the command "brew list" to get a list of installed
packages and save this list to a file on the Desktop.
Then, remove /usr/local completely and invoke the install.sh
script.

After this, pihpsdr should be able to run. If this succeeds, you can
load any packages that you need and that were in your previous 
homebrew universe by "brew install" commands (you have saved the list of
packages installed previously in a file on the Desktop). You also can
(should) copy any non-homebrew file that were in your old /usr/local from your backup
to your new /usr/local.

Start pihpsdr for the first time
================================

If you now try to start piHPSDR by double-clicking the piHPSDR icon,
you most likely get a message that this program is downloaded from
the internet and execution is not permitted for security reasons.
But if you now open the "Security" control panel, you get a message
there in the lower half of the window and can check a button to open
the program anyway. Since I am not a professional MacOS developer,
I cannot code-sign the program.

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
with the Adalm Pluto connected via an USB cable to the Macintosh, the only
SoapySDR-supported hardware that I have. Additionally, I have included 
supportfiles for LimeSDR and RTL sticks.
