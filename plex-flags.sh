#!/bin/bash
# Path where the flag images are stored
flag_path="/mnt/user/data/media/flags"
# Path to the poster
flink=$(readlink -f folder.jpg)
# Get the width of the folder image
widthfolder=$(exiftool -f -s3 -"ImageWidth" "$flink")
# Set the width for the flag (1/5 of the poster width)
widthposter=$(expr $widthfolder / 5)

# Check if the argument contains "es" (Spanish language code)
case $1 in
  *es*)
    # Resize the Spanish flag to match the desired width
    convert "$flag_path/es.png" -resize "$widthposter" "$flag_path/es_tmp.png"
  ;;
esac

# If the Spanish flag was resized, place it on the poster
if [ -f "$flag_path/es_tmp.png" ]; then
  convert "$flink" "$flag_path/es_tmp.png" -geometry +8+8 -composite "$flink"
  chmod +644 "$flink"
  chown nobody "$flink"
  exiftool -creatortool="993" -overwrite_original "$flink"
  rm "$flag_path/es_tmp.png"
fi
