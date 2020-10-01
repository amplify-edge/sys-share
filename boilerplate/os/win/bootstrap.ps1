# RUN THIS in powershell

# https://github.com/lukesampson/scoop
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

scoop update

# multiple connections for scoop
scoop install aria2

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
scoop install vscode
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
# Do we need it ?
# If we do: https://github.com/Deide/deide-bucket/blob/master/bucket/glfw.json

# gcc
# needed for golang CGO etc.
scoop install gcc

# dart
# I dont think its needed actually... we see.
#scoop install dart-dev

# flutter
scoop install flutter
# OR git clone like in the MAC bootstrap.
# Can someone on make test this and ad the correct code :)
