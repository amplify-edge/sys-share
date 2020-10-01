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
export PATH=$ANDROID_SDK/bin:$FLUTTER_ROOT/bin:$HOMEBREW_INSTALL/bin:$HOMEBREW_INSTALL/sbin:$JAVA_HOME/bin:$DART_HOMEPATH:$GOPATH/bin:$FLUTTER_PATH:$GOROOT/bin:$PATH