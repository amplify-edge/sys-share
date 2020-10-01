# RUN THIS in powershell

# Check to see if we are currently running "as Administrator"
# See: https://github.com/mvijfschaft/dotfiles/blob/master/install.ps1


# https://github.com/lukesampson/scoop
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

scoop update

# multiple connections for scoop
scoop install aria2
scoop config aria.enabled true

# extra repo has the other stuff we need
scoop bucket add extras

# git
scoop install git
# which
scoop install which
# make
scoop install make

# openssh
#scoop install openssh
# [environment]::setenvironmentvariable(‘GIT_SSH’, (resolve-path (scoop which ssh)), ‘USER’)

# vscode
#scoop install vscode
# tell vscode where git is:
# which git
# then File > Preferences > Settings, and under User Settings add: "git.path”: “c:\\the\\path\\to\\git”
# restart and then do: code .

# go
# https://github.com/golang/go/wiki/windows-scoop-install-go-cli
# See screen shot for setting up you Environment variables.
scoop install go 

# protoc
scoop install protobuf

# glfw
# Do we need it for Windows ?
# If we do: https://github.com/Deide/deide-bucket/blob/master/bucket/glfw.json
scoop bucket add deide-bucket
scoop install glfw

# gcc
# needed for golang CGO etc.
scoop install gcc

# dart
# I dont think its needed actually... we see.
#scoop install dart-dev

# flutter
# needs a few things to compile for android
#scoop bucket add java
# DOnt use Oracles Java !
#scoop install adoptopenjdk-hotspot
# its fat but it gets us everything we need
#scoop install android-studio

# https://github.com/lukesampson/scoop-extras/blob/master/bucket/flutter.json
# then calls: https://raw.githubusercontent.com/lukesampson/scoop-extras/master/scripts/flutter-dev-setup.ps1
scoop install flutter


