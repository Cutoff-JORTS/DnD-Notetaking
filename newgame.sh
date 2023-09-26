#! /bin/bash
#extra comment to test Github push

#Campaign Maker - Adds a new directory folder structure to interact with existing D&D note search scripts (please note - $storage is a user-defined variable for local storage path)
#Author - jort

declare storage="/home/bilbo/Documents/DnDserver/Active_Game_Notes"
declare gameday
declare title
declare recording

cd $storage
echo "Welcome to $PWD"
echo " "
echo "My name is Campaign Maker, let's get your new game added in!"
echo "-------------------------------------------------------------"
read -p "What day is your game played on? --" gameday
read -p "What is the tile (or abbreviation) of the campaign? --" title
echo "Will you be recording audio for this campagin? (Y=yes || Enter=skip ): "
read -n1 recording


mkdir $gameday\_$title
mkdir $gameday\_$title/Text_Notes
if [[ $recording ]]
then mkdir $day\_$title/Audio_Notes
fi


cd $storage/$day\_$title/
echo " "
echo "Thank you, now navigated to $gameday_$title."
echo "--------------------------------------------"
echo "$PWD"
