
#! /bin/bash

#RestFinder2 (to be used with 'newgame.sh' storage format)
#Navigates to D&D Game Notes, prompts user for game to search, looks for instances of the word: rest, and displays output for user.

#Author: jort

#variables
declare mygames="/home/bilbo/Documents/DnDServer/Active_Game_Notes/"
declare searchpool

#Navigate to D&D Notes Directory
cd $mygames

clear

#Welcome text to greet reader and explain script
	echo " "
	echo "Hail and well met!"
	echo " " 
	echo "Welcome to RestFinder, weary scribe. I am a tool to aid you in your journey."
	echo " " 
	echo "Please designate which scrolls to search over, and I will provide results posthaste."
	echo "(note - syntax for campaign names is DayOfWeek_Name_of_Campaign)"
	echo " "

#Lists the available campaigns for the user
        echo "Adventure Notes in the Archives:"
        echo " "
	echo "-----"
        ls
        echo "-----"
        echo " "
#intake name of desired campaign
        read -p "Campaign Name: " searchpool

#Verify that campaign exists && has a notes folder
#yes, I am aware this could cause a memory leak, as it could loop infinitely until a proper response is entered.
#this is a script for my private use, and I have no plans to distribute this to a user who would "fail to read the manual"
	until  [[ -e $searchpool/Text_Notes ]]; do
		echo " "
		echo "-----"
		echo "Please re-enter the name of the scrolls I am to search through."
		echo "(reminder - syntax for campaign names is DayOfWeek_Name_of_Campaign)"
	        echo "-----"
		echo "Adventure Notes in the Archives:"
		echo " "
		ls
		echo "-----"
	#intake name of campaign again
		read -p "Campaign Name: " searchpool
	done
#Begin searching
	touch $searchpool/.restlog.tmp
	touch $searchpool/rest_log.txt
	echo " "
	echo "..."
	echo "Retreiving scrolls from the archives..."
sleep 2
	echo "Searching your well-written and detailed notes, Master Scribe, thank thee for thine patience."
sleep 3
	echo " "
	echo " " 
	grep -irwn 'rest' $searchpool/Text_Notes/ > $searchpool/.restlog.tmp
 sed -e 's/Monday/-/; s/Tuesday/-/; s/Wednesday/-/;  s/Thursday/-/; s/Friday/-/; s/Saturday/-/; s/Sunday/-/;  s/Text_Notes/-/' $searchpool/.restlog.tmp > $searchpool/rest_log.txt
clear
less $searchpool/rest_log.txt

#Exits script with reminder for how to activate
	echo " "
	echo " "
	echo " "
	echo "Thank thee for thine patience, Master Scribe."
	echo " "
	echo "Please call upon my services whenever thou needest, by simply invoking my name - RestFinder"
sleep 2
	clear
exit 0
