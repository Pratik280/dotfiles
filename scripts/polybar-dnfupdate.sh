#!/bin/sh

cupd=$(dnf check-update | wc -l)
echo "Updates : $cupd"

