#!/bin/sh
mogrify -format jpg -resize 1200X1200 -quality 80 -strip -path compressed/ *
