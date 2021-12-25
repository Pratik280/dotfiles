#!/usr/bin/env bash
#
# Script name: dmsearch
# Description: Search various search engines (inspired by surfraw).
# Dependencies: dmenu and a web browser
# GitLab: https://www.gitlab.com/dwt1/dmscripts
# Contributors: Derek Taylor

# Defining our web browser.
DMBROWSER="brave"

# An array of search engines.  You can edit this list to add/remove
# search engines. The format must be: "engine_name - url".
# The url format must allow for the search keywords at the end of the url.
# For example: https://www.amazon.com/s?k=XXXX searches Amazon for 'XXXX'.
declare -a options=(
"amazon - https://www.amazon.in/s?k="
"archwiki - https://wiki.archlinux.org/index.php?search="
"bbcnews - https://www.bbc.co.uk/search?q="
"cnn - https://www.cnn.com/search?q="
"coinbase - https://www.coinbase.com/price?query="
"debianpkg - https://packages.debian.org/search?suite=default&section=all&arch=any&searchon=names&keywords="
"duckduckgo - https://duckduckgo.com/?q="
"ebay - https://www.ebay.in/sch/i.html?&_nkw="
"github - https://github.com/search?q="
"gitlab - https://gitlab.com/search?search="
"google - https://www.google.com/search?q="
"googleimages - https://www.google.com/search?hl=en&tbm=isch&q="
"googlenews - https://news.google.com/search?q="
"imdb - https://www.imdb.com/find?q="
"reddit - https://www.reddit.com/search/?q="
"sourceforge - https://sourceforge.net/directory/?q="
"translate - https://translate.google.com/?sl=auto&tl=en&text="
"urban - https://www.urbandictionary.com/define.php?term="
"wikipedia - https://en.wikipedia.org/wiki/"
"youtube - https://www.youtube.com/results?search_query="
"quit"
)

# Picking a search engine.
while [ -z "$engine" ]; do
enginelist=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i 20 -p 'Choose search engine:') || exit
engineurl=$(echo "$enginelist" | awk '{print $NF}')
engine=$(echo "$enginelist" | awk '{print $1}')
done

# Searching the chosen engine.
while [ -z "$query" ]; do
query=$(rofi -dmenu -i 20 -p "Searching $engine:") || exit
done

# Display search results in web browser
$DMBROWSER "$engineurl""$query"

