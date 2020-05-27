#!/bin/sh

#
# This installs the "command line tools", these are necessary to install the
# homebrew universe
#
xcode-select --install

#
# This installes the core of the homebrew universe
#
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#
# This installs all the "homebrew" packages needed for *running* pihpsdr.
# Note the WDSP and SoapySDR libraries are contained in the app bundle
#
brew install gtk+3
brew install pkg-config
brew install portaudio
brew install fftw
brew install libusb
#
# This is for PrivacyProtection
#
brew analytics off 
#
# This is to delete any SOAPY support files that might still lurk around in /usr/local/lib
#
rm -rf /usr/local/lib/SoapySDR
rm -rf /usr/local/lib/libLimeSuite.*
rm -rf /usr/local/lib/librtlsdr.*
rm -rf /usr/local/lib/iio.framework
rm -rf /usr/local/lib/libSoapySDR.*
#
# Extract the pihpsdr app bundle
#
cd $HOME/Desktop
rm -rf pihpsdr.app
tar xf pihpsdr.app
#
# Extract the SOAPY files for /usr/local
#
cd $HOME/Desktop
tar xfP soapy.tar
