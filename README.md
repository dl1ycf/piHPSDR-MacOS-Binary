# piHPSDR-MacOS-Binary

Since this binary has been created on a Mac running
MacOS 10.15 "Catalina", it will not run on earlier
versions.

This binary is bundled with the WDSP library but
all other libraries, including SoapySDR and its
support modules, must be present.

To this end, a "homebrew" universe must be created
on your Mac, and the required libraries must be installed.

This is done automatically with the shell script named
"install.sh".

So download the file install.sh and put it on your
Desktop. To this end, click "install.sh" and then the "Raw"
button, then you can save the plain text file to your Desktop.

Open the "terminal" app. If you have never used it, it is in the folder
/Applications/Utilities. In the terminal window that opens, type in the following
commands:

---------------------------------------------------------------------------

cd $HOME/Desktop

chmod 700 install.sh

./install.sh

---------------------------------------------------------------------------

You will be asked the aministrator password of your Macintosh *once*.

The application bundle itself is compressed (pihpsdr.app.zip). You can
download it and decompress by double-clicking it.

What if "homebrew" is already installed?
========================================

In this case, you should still execute the "install.sh" script.
Existing homebrew packages that you might use are not deleted,
but possibly some new ones are installed.

Start pihpsdr for the first time
================================

If you now try to start piHPSDR by double-clicking the piHPSDR icon,
you might get warned that this program is downloaded from the internet
and therefore potentially insecure. MacOS won't start the program
then. You have to go the the "Security" control panel and confirm
in the lower part of the panel that you really want to start the
program.

Furthermore, you might get asked whether you want to allow piHPSDR to
use your microphone when it is first started.
This questions refers to sound input devices in general,
so answer "yes".

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
supportfiles for LimeSDR, RTL sticks, AirSpy, AirSpyHF, HackRF but I cannot
test this. (Volunteers are welcome to test
this, please report your findings to dl1ycf@darc.de).
