#! /bin/sh 
os="$(awk '{print $1,$2,$3}' /etc/fedora-release )"
 kernel="$(uname -r | awk --field-separator '.' '{print $1 "." $2 "." $3}')"
echo "$os - $kernel"
echo "$kernel"
