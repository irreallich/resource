#!/bin/sh

if [ ! -f "wps_symbol_fonts.zip" ]; then
    echo "wps_symbol_fonts.zip not exist, exit..."
    exit 1
fi

echo "unzip file wps_symbol_fonts.zip ..."
unzip wps_symbol_fonts.zip -d wps_symbol_fonts
if [ 0 -ne $? ]; then
    echo "unzip wps_symbol_fonts.zip failed, exit..."
    exit 1
fi

echo "mv wps_symbol_fonts to /usr/share/fonts/ ..."
sudo mv wps_symbol_fonts /usr/share/fonts/
if [ 0 -ne $? ]; then
    echo "mv wps_symbol_fonts to /usr/share/fonts/ failed, exit..."
    exit 1
fi

cd /usr/share/fonts/wps_symbol_fonts/
if [ 0 -ne $? ]; then
    echo "cd to /usr/share/fonts/ failed, exit..."
    exit 1
fi

sudo mkfontscale
if [ 0 -ne $? ]; then
    echo "sudo mkfontscale failed, exit..."
    exit 1
fi

sudo mkfontdir
if [ 0 -ne $? ]; then
    echo "sudo mkfontdir, exit..."
    exit 1
fi

sudo fc-cache
if [ 0 -ne $? ]; then
    echo "sudo fc-cache, exit..."
    exit 1
fi

cd -
cd ..

rm -rf wps_fonts
