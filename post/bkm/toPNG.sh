for file in *.svg; do inkscape $file -e ${file%svg}png; done
