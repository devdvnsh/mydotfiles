
#!/bin/zsh

# Wallpaper directory
WALLPAPER_DIR="/home/dev/.config/assets/backgrounds/Primeagen/anime/"

# Select a random wallpaper
RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Set wallpaper using swww
swww img "$RANDOM_WALLPAPER" --transition-type grow --transition-duration 0

