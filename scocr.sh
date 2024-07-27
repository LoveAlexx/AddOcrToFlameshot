#!/bin/bash

flameshot gui --accept-on-select --path /tmp/screenshot.png

if [ -f /tmp/screenshot.png ]; then
   
    tesseract /tmp/screenshot.png /tmp/ocr_output

    cat /tmp/ocr_output.txt | xclip -selection clipboard

    rm /tmp/screenshot.png /tmp/ocr_output.txt
else
    echo "Screenshot capture failed."
fi
