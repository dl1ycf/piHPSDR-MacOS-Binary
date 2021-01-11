# piHPSDR-MacOS-Binary

Since this binary has been created on a Mac running
MacOS 10.15 "Catalina", it will not run on earlier
versions. It runs also with MacOs 11.1 "BigSur".

This binary is bundled with the WDSP library but
all other libraries, including SoapySDR and its
support modules, must be present.

To this end, a "homebrew" universe must be created
on your Mac, and the required libraries must be installed.

This is done automatically with a shell script.
To facilitate the download, both the piHPSDR application
and the "homebrew installation" shell script are
compressed (.zip files), so they can be easily down-loaded
from the github web page just by double-clicking the two
file in an internet browser window.

So you use your browser and go to this web page,

https://github.com/dl1ycf/piHPSDR-MacOS-Binary

Then you click on "install.sh.zip" and then, on the page that opens,
on the "Download" button. You do the same with "pihpsdr.app.zip". Depending
on the configuration of your browser, the files might get "unpacked"
automatically or semi-automatically upon downloading them. The exact
location where they are stored also depends on the configuration of your
internet browser, the default is the "Downloads" folder within your home
directory.

If the files still contain the ".zip" externsion, that is, they are not
yet "unpacked", unpack both of them by double-clicking then drag them
(if they are not there yet) on the Desktop.

Open the "terminal" app. If you have never used it, it is in the folder
/Applications/Utilities. In the terminal window that opens, type in the following
commands:

---------------------------------------------------------------------------

cd $HOME/Desktop

./install.sh

---------------------------------------------------------------------------

Normally you will have to confirm that you want to install "homebrew" with the
"enter" key and then You will be asked the aministrator password of your Macintosh *once*.


What if "homebrew" is already installed?
========================================

In this case, you should still execute the "install.sh" script.
Existing homebrew packages that you might use are not deleted,
but possibly some new ones are installed.

Start pihpsdr for the first time
================================

If you now try to start piHPSDR by double-clicking the piHPSDR icon,
you will get a message that this program cannot be started because
the program developer cannot be verified. This is normal for programs
created by amateur programmers such as me. After closing the dialogue,
you can open the "Security" control panel and click in the bottom half
that you want to open the program anyway (this has to be done only once).

Then, if the program is running on your machine for the first time,
it has to determine the optimal way to do Fourier transforms. This
process is called "creating a wisdom file". This file is then stored
in the ~Library/Application Support/piHPSDR directory and need not
be calculated again in subsequent runs of the program.

Finally, when you first start a radio with the program, you will
be asked whether you grant microphone access to piHPSDR. If you
intend to use local audio devices for input, you have to agree.

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
