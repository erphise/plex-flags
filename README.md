### How This Script Works:

1. **Flag Path**: `flag_path="/mnt/user/data/media/flags"` should be where you store the Spanish flag image (e.g., `es.png`).

2. **Poster Image**: The script automatically identifies the `folder.jpg` image in each media directory, which is typically used as the poster image.

3. **Language Check**: The script checks if "es" (Spanish) is present in the language codes passed to the script.

4. **Flag Resizing and Placement**: If "es" is found, the Spanish flag is resized and placed on the bottom right corner of the poster image.

5. **Permissions**: The script ensures the correct permissions are set for the poster image after modification.

### Instructions to Use:

1. **Place Flags**: Ensure that the Spanish flag (`es.png`) is saved in `/mnt/user/data/media/flags/`.

2. **Run the Script**: Execute this script in each movie or TV show directory where you want to check for Spanish availability. You can loop through your directories and call this script with the appropriate language codes as arguments.

### Example Usage:

You can run the script like this:

```
./your-script.sh es
```

This will check if the media has Spanish language availability and will overlay the Spanish flag if found.

### Automating the Process:

To apply this across all movies and TV shows, you can use a script like this:

```
#!/bin/bash

# Loop through all movie and TV show directories
for dir in /mnt/user/data/media/movies/* /mnt/user/data/media/tv/*; do
  if [ -d "$dir" ]; then
    # Change to the directory
    cd "$dir"
    # Run the flag setting script
    /path/to/your-script.sh es
  fi
done
```

This script loops through all directories in your movies and TV shows folders, checks for Spanish availability, and overlays the flag if appropriate.
