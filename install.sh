#!/bin/sh

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#
# This installs all the "homebrew" packages needed for *running* pihpsdr.
# Note the WDSP and SoapySDR libraries are contained in the app bundle
#
brew install gtk+3
brew install pkg-config
brew install portaudio
brew install fftw
#
# This is for PrivacyProtection
#
brew analytics off 
