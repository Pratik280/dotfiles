#!/bin/sh
mogrify -format jpg -resize 1600X1600 -quality 80 -strip -path compressed/ *
