#!/usr/bin/env bash
# Stuff i need
rm -rf $HOME/.{profile,bash_profile,zprofile}
cat <<<EOF >>>${HOME}/.profile
# bashrc or bash_profile
# Change this if you use a different username on your Mac.
# USER=apple
# echo "Environment:"
# echoLog "USER" $USER
# 
### GoLang ###
GO111MODULE=on
GOROOT=/usr/local/opt/go/libexec
# for gomobile & protoc-gen-go
GOPATH=$HOME/workspace/go
# flutter
FLUTTER_PATH=$HOME/flutter/bin
# dart 
DART_HOMEPATH=$HOME/.pub-cache/bin
# java
JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-12.0.2.jdk/Contents/Home"
ANDROID_SDK=$HOME/Library/Android/sdk
ANDROID_HOME=$ANDROID_SDK
ANDROID_NDK=$ANDROID_SDK/ndk-bundle
ANDROID_PLATFORM_TOOLS=$ANDROID_SDK/platform-tools
ANDROID_TOOLS=$ANDROID_SDK/tools
FLUTTER_ROOT=$HOME/fvm/master
### HomeBrew ###
HOMEBREW_INSTALL=/usr/local

export GOROOT GO111MODULE GOPATH JAVA_HOME ANDROID_HOME ANDROID_SDK ANDROID_NDK ANDROID_PLATFORM_TOOLS ANDROID_TOOLS
export PATH=$ANDROID_SDK/bin:$FLUTTER_ROOT/bin:$HOMEBREW_INSTALL/bin:$HOMEBREW_INSTALL/sbin:$JAVA_HOME/bin:$DART_HOMEPATH:$GOPATH/bin:$FLUTTER_PATH:$GOROOT/bin:$PAT
EOF

cat <<<EOF >>>${HOME}/.bash_profile
if [ -r ~/.profile]; then
   source ~/.profile
fi
EOF

cat <<<EOF >>>${HOME}/.zprofile
emulate sh -c '. $HOME/.profile'
EOF

# RUN THIS in termianl
# Install brew 
# https://brew.sh/

xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew upgrade

# git
brew install git
brew install hyperkit docker-machine-hyperkit minikube

# vscode
# https://www.code2bits.com/how-to-install-visual-studio-code-on-macos-using-homebrew/
brew cask install visual-studio-code
# MAY need to do this:
# tell vscode where git is:
# which git
# then File > Preferences > Settings, and under User Settings add: "git.path”: “c:\\the\\path\\to\\git”
# restart and then do: code .

# go
brew install go

# protoc
brew install protobuf

# gcc
# needed for golang CGO etc.
brew install gcc
brew install coreutils

# flutter IOS stuff
brew install --HEAD libimobiledevice
brew install ideviceinstaller ios-deploy cocoapods
pod setup

# sometimes needed
# brew upgrade cocoapods

# flutter
# needs a fw other things first
brew cask install adoptopenjdk8
brew cask install android-studio

# flutter
# using tarball
curl -o $HOME/flutter.tar.xz -L "https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_macos_v1.12.13+hotfix.9-stable.tar.xz"
tar -xvf $HOME/flutter.tar.xz 
./flutter/bin/flutter channel beta
./flutter/bin/flutter upgrade && ./flutter/bin/flutter --enable-web
yes | ./flutter/bin/flutter --android-licenses
## activate protobuf
pub global activate protoc_plugin
# ./flutter/bin/flutter doctor