#! /bin/sh 
# os="$(cat /etc/fedora-release)"
# os="$(awk '{print $1,$2,$3}' /etc/fedora-release )"
# kernel="$(uname -r)"
# kernel="$(uname -r | awk --field-separator '.' '{print $1 "." $2 "." $3}')"
# echo "$os - $kernel"
kernel="( lsb_release -ds || cat /etc/*release || uname -om ) 2>/dev/null | head -n1"
echo "$kernel"
