#!/usr/bin/env bash 

rm -rf $HOME/.{profile,bash_profile,zprofile}
cat ${HOME}/.profile
### GoLang ###
GO111MODULE=on
GOROOT=/usr/local/go
# for gomobile & protoc-gen-go
GOPATH=$HOME/go
# flutter
FLUTTER_PATH=$HOME/flutter/bin
# dart 
DART_HOMEPATH=$HOME/.pub-cache/bin
# java
JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
ANDROID_SDK=$HOME/.Android/sdk
ANDROID_HOME=$ANDROID_SDK
ANDROID_NDK=$ANDROID_SDK/ndk-bundle
ANDROID_PLATFORM_TOOLS=$ANDROID_SDK/platform-tools
ANDROID_TOOLS=$ANDROID_SDK/tools

export GOROOT GO111MODULE GOPATH JAVA_HOME ANDROID_HOME ANDROID_SDK ANDROID_NDK ANDROID_PLATFORM_TOOLS ANDROID_TOOLS
export PATH=$JAVA_HOME/bin:$DART_HOMEPATH:$GOPATH/bin:$FLUTTER_PATH:$GOROOT/bin:$PATH

cat ${HOME}/.bash_profile
if [ -r ~/.profile ]; then
   source ~/.profile
fi

type apt && {
    sudo apt update -y
    sudo apt install -y curl unzip git openssh-server gcc openjdk-8-jdk flatpak qemu-kvm libvirt-dev virt-manager build-essential protobuf-compiler libprotobuf-dev
}

type -q dnf || type -q yum && {
    sudo dnf --refresh upgrade --best --allowerasing -y
    sudo dnf install -y curl unzip git openssh-server gcc java-8-openjdk qemu-kvm qemu-img virt-manager libvirt libvirt-python libvirt-client virt-install virt-viewer bridge-utils protobuf-devel
}

mkdir -p $HOME/bin
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.google.AndroidStudio

cat $HOME/bin/astudio
#!/usr/bin/env bash
flatpak run com.google.AndroidStudio
chmod +x $HOME/bin/astudio

# go
GOLANG_FILE=go1.13.4.linux-amd64.tar.gz
curl https://dl.google.com/go/${GOLANG_FILE} -o ${GOLANG_FILE}
sudo tar -C /usr/local/ -xzf ${GOLANG_FILE}
rm -f ${GOLANG_FILE}

# setup gopath
mkdir -p $HOME/go

# protoc
PROTOC_VERSION=3.10.1
PROTOC_FILE=protoc-${PROTOC_VERSION}-linux-x86_64.zip
curl https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOC_VERSION}/protoc-${PROTOC_VERSION}-linux-x86_64.zip -L -o protoc-${PROTOC_VERSION}-linux-x86_64.zip
unzip -o protoc-${PROTOC_VERSION}-linux-x86_64.zip -d $GOPATH
rm -f ${PROTOC_FILE}

# Flutter github
curl -o $HOME/flutter.tar.xz -L "https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.12.13+hotfix.9-stable.tar.xz"
tar -xvf $HOME/flutter.tar.xz 
./flutter/bin/flutter channel beta
./flutter/bin/flutter upgrade && ./flutter/bin/flutter --enable-web
yes | ./flutter/bin/flutter --android-licenses
## activate protobuf
pub global activate protoc_plugin
./flutter/bin/flutter doctor
