#!/usr/bin/env bash
# Move osu! beatmaps & skins to your osu! directory with ease.
# ----------------------------------------------------

### CONSTANTS

# Insert your absolute path to your osu! directory.
# NOTE: HAS TO BE AN ABSOLUTE PATH, NO STRINGS! e.g. /my\ osu\!\ wine\ prefix/drive_c/Program\ Files/osu\!/
OSU_DIR=/path/to/osu/dir

### FUNCTIONS

##################################
# Shows info about osu!move
##################################
showHelp() {
    echo "osu!move - Move your beatmaps & skins to your osu! directory with ease."
    echo ""
    echo "OPTIONS"
    echo -e "\t \033[0;35m-b (beatmaps)\033[0m    will move every file that is a beatmap file (osz)"
    echo -e "\t \033[0;34m-s (skins)\033[0m       will uncompress every file that is a skin file and then move it (osk)"
    echo -e "\t \033[0;32m-a (all)\033[0m         move every single osu!-related file into their respective directories"
    echo ""
    echo "CONFIGURATION"
    echo -e "\t \033[1;33m-d [OSU_DIR]\033[0m     set or change the osu! directory"
    echo ""
    echo "CURRENT OSU! DIRECTORY:" 
    echo -e "\t \033[1;31m${OSU_DIR}\033[0m"
}

##################################
# Move beatmaps
# Globals:
#   OSU_DIR
# Output:
#   Moves beatmaps to the songs dir
##################################
moveBeatmaps() {
    for file in "${PWD}/*.osz"; do
        echo "Moving beatmap(s) ... -> " $file
        if mv $file "${OSU_DIR}Songs"; then
            echo "Moved beatmap(s) successfully!"
        fi
    done
}

##################################
# Move skins
# Globals:
#   OSU_DIR
# Output:
#   Moves skins to the skins dir
##################################
moveSkins() {
    for file in "${PWD}/*.osk"; do
        echo "Moving skin(s) ... -> " $file
            if unar -o "${OSU_DIR}Skins" $file; then
                rm $file
                echo "Moved skin(s) successfully!"
            fi
    done
}

##################################
# Move every file to their dirs
# Globals:
#   OSU_DIR
# Output:
#   Moves every file to their dirs
##################################
moveAll() {
    moveBeatmaps
    moveSkins
    exit 1
}

##################################
# Set the OSU_DIR
# Globals:
#   OSU_DIR
# Arguments:
#   directory
# Output:
#   Sets the directory to OSU_DIR
##################################
changeDIR() {
    if [[ -d $OPTARG ]]; then
        OSU_DIR=$OPTARG
        echo "The osu! directory has been updated to: ${OPTARG}"
        exit 1
    else
        echo "The directory \"${OPTARG}\" is not valid or can't be accessed."
        exit 1
    fi
}

##################################
# MAIN
##################################
if [ $# -eq 0 ]; then
    showHelp
    exit 0
else
    while getopts 'hbsad:' flag; do
        case "${flag}" in
            h)
                showHelp
            ;;
            b)
                moveBeatmaps
            ;;
            s)
                moveSkins
            ;;
            a)
                moveAll
            ;;
            d)
                changeDIR
            ;;
            *)
                showHelp
                exit 1
            ;;
        esac
    done
fi
