# Adding OCR To flameshot / How to copy text from videos / How to copy unselectable text / Screenshot OCR
How to add OCR fucntionality to flameshot, without needing to change the program at all.

**Showcase**:

https://github.com/user-attachments/assets/30b183f0-df74-42e3-9796-93ba6334260d


**Installing xclip, tesseract and tesseract's training data, then moving its training data to the appropriate location** 

note: you can check where you need to move the files by running `tesseract`, the error will state where the files are missing. It will either be in `/usr/share` or `/usr/local`

Install the appropriate packages:
`sudo pacman -S tesseract xclip`
 
Clone the training data:
`wget https://github.com/tesseract-ocr/tessdata/raw/main/eng.traineddata`

Move the training data to tesseract:
`sudo mv eng.traineddata /usr/share/tessdata/` 

**Making a bash script to OCR a temporary flameshot image**

Make a shell script in whatever location you chose, in this case I will be using `~/Documents/Scripts`.

`nvim ~/Documents/Scripts/scocr.sh`

 Then paste the following code into it:

```
#!/bin/bash

flameshot gui --accept-on-select --path /tmp/screenshot.png

if [ -f /tmp/screenshot.png ]; then
   
    tesseract /tmp/screenshot.png /tmp/ocr_output

    cat /tmp/ocr_output.txt | xclip -selection clipboard

    rm /tmp/screenshot.png /tmp/ocr_output.txt
else
    echo "Screenshot capture failed."
fi
```

And finally, make the file executable by running 

`chmod +x scocr.sh`

**Making a hotkey for the script on KDE**

Open Settings>System Settings>Keyboard>Shortcuts and click 'Add New', select 'Command or Script'.

And type the following command: 

`sh /home/Username/ScriptLocation` 

Replace Username and ScriptLocation with your local user and the location with the location of the script.

Click on 'Add custom shortcut' and add whatever key combination you want.

Click 'Apply'

**You now have OCR with the press of a few buttons!**
