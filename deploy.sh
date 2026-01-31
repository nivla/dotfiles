#!/bin/bash

set -e

SCRIPT_DIR="$( cd "$( dirname "$BASH_SOURCE[0]" )" && pwd )"

echo $SCRIPT_DIR

symLinkFile() {
    filename="$SCRIPT_DIR/$1"
    destination="$HOME/$2/$1"

     echo "$destination"

     mkdir -p $(dirname "$destination")

     if [ -L "$destination" ]; then
	 echo "[WARNING] $filename already sysmlinked"
	 return
     fi

     if [ -e "$destination" ]; then
	 echo "[ERROR] $destination exists but it's not a symlink. please fix it manually"
	 exit 1
     fi

     ln -s "$filename" "$destination"
     echo "[OK] $filename -> $destination"
}

deployManifest() {
    for row in $(cat $SCRIPT_DIR/$1); do
	if [[ "$row" =~ ^#.* ]]; then
	    continue
	fi

	filename=$(echo $row | cut -d \| -f 1)
	operation=$(echo $row | cut -d \| -f 2)
	destination=$(echo $row | cut -d \| -f 3)

	case $operation in
	    symlink)
		symLinkFile $filename $destination
		;;

	    *)
		echo "[WARNING] Unknown operation $operation. Skipping..."
		;;
	  esac
    done
}

deployManifest $1
