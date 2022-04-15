#! /bin/sh 
# os="$(cat /etc/fedora-release)"
os="$(awk '{print $1,$2,$3}' /etc/fedora-release )"
# kernel="$(uname -r)"
kernel="$(uname -r | awk --field-separator '.' '{print $1 "." $2 "." $3}')"
echo "$os - $kernel"
