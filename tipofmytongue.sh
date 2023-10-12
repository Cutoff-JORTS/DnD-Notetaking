#! /bin/bash

#Tip Of My Tongue (to be used with 'newgame.sh' storage format)
#Navigates to D&D Game Notes, prompts user for game to search, prompts user for any number of words to search for within campaign notes stored in chosen directory.

#*Note on portability - update variable $storage with directory path for your environment)
#Author: jort

#-----VARIABLES UP HERE------
declare $storage="/jortpool/LabStorage/Dungeons_and_Dragons/Active_Game_Notes"
declare searchpool
declare -l searchterms
declare searchprompt

#-----FUNCTIONS DOWN HERE-----

#Select the proper campaign notes
function choose_adventure {
	clear
	cd $storage
	clear
	echo " "
	echo "Hail and well met!"
	sleep .5
	echo " "
	echo "Welcome to Tip_of_My_Tongue, weary scribe. I am a tool to aid you in your journey."
	echo " "
	sleep .5
	echo "Please designate which scrolls to search over, and I will provide results posthaste."
	echo " "
	echo "(note - syntax for campaign names is DayOfWeek_Name_of_Campaign)"
	echo " "
	echo " "
	echo "-----"
	echo "Adventure Notes in the Archive:"
	echo " "
	ls
	echo "----- "
	echo " " 
#intake name of desired campaign
	read -p "Campaign Name: " searchpool

#Verify that campaign exists && has a notes folder
	until  [[ -e $searchpool/Text_Notes ]]; do
		echo " "
		echo "-----"
		echo "Please re-enter the name of the scrolls you want searched."
		echo "(reminder - syntax for campaign names is DayOfWeek_Name_of_Campaign)"
		echo " "
		echo " "
		echo "-----"
		echo "Adventure Notes in the Archive:"
		echo " "
		ls
		echo "-----"
		echo " "
		read -p "Campaign Name: " searchpool
	done

	sleep .25
}

#-------

#intake name of desired search term:
function lookforit {
	touch $searchpool/.raw_log.txt			#verify existence of || create search log file
	echo " " > $searchpool/.raw_log.txt		#clears search log of any old data before appending with results
	clear
	echo "-----------------------------"
	echo "Current Scrolls: $searchpool"
	echo "----------------------------- "
	echo " "
	echo "Thank you kindly, Master Scribe."
	echo " " 
	echo " " 
	echo "Please tell me what is on the tip of thine tongue, that you wish  me to find amongst your scrolls"
	echo " "
	echo "(Please separate any desired terms with a space.)"	#helpful reminder for user
	echo " " 
	echo " -----------------"
	read -p "Search for: " searchprompt		#establish a string of words to add to array
	declare -a searchterms=($searchprompt)		#builds array of search terms
	declare -i promptcount="${#searchterms[@]}"	#esstablishes number of terms in array to use
	echo " " 
	echo " " 
	echo "-----"
	echo " " 
	echo "Confirmed, I will find any instance of these $promptcount terms in the notes for $searchpool."
	sleep .5


#Begin searching
	echo " " 
	echo " " 
	echo "Retreiving scrolls from the archives..."
	sleep .7
	echo " " 
	echo " " 
	echo "Searching your well-written and detailed notes, Master Scribe, thank thee for thine patience."
	sleep .7
	echo " "
	echo " " 
	
	for ((i=0; i<$promptcount; i++)); do
			echo "Matching lines for: ${searchterms[i]}" >> $searchpool/.raw_log.txt
			echo " " >> $searchpool/.raw_log.txt

		grep -irwn ${searchterms[i]} $searchpool/Text_Notes >> $searchpool/.raw_log.txt
			echo " " >> $searchpool/.raw_log.txt
			echo "-----" >> $searchpool/.raw_log.txt
	done
	
	echo "Thank thee for thine patience, Master Scribe. Here is what I could find:"
	sleep 3
	clear 
	
	sed -e 's/Monday/-/; s/Tuesday/-/; s/Wednesday/-/;  s/Thursday/-/; s/Friday/-/; s/Saturday/-/; s/Sunday/-/;  s/Text_Notes/-/' $searchpool/.raw_log.txt > $searchpool/search_log.txt
	less $searchpool/search_log.txt
}

#-------

function goodbye {
	cd ~
	clear
	sleep .5
	echo " "
	echo " "
	echo " "
	echo "Please call upon my services whenever thou needest, by simply invoking my name - TipOfMyTongue"
	sleep 3
	clear
	exit 0
}

#-----MENU TIME!-------

cd $storage
clear
choose_adventure

while true; do 
clear
echo " "
echo "Tip Of My Tongue - Adventurer research services"
echo "This is a public service provided by the Blackstaff Tower of Waterdeep."
echo " "
echo " "
echo "-------------------------------------------------------- "
echo "confirming name of your selected campaign is $searchpool."
echo "---------------------------------------------------------"
echo " "
echo "Please choose from the following:"
echo "1 - search notes for key information"
echo "2 - change campaign to search"
echo "3 - send me off and end searching"
read -sn1

case "$REPLY" in
	1) lookforit;;
	2) choose_adventure;;
	3) goodbye;;
esac

done
