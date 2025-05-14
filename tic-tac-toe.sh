#! /bin/bash

# pos variables to track value
p11=' '; p12=' '; p13=' '
p21=' '; p22=' '; p23=' '
p31=' '; p32=' '; p33=' '

# variable to track turn: x/o
turn='x'

# variable to track win status to stop the game loop
won=false

function run_game () {
	echo -e "Tic Tac Toe\n"
	echo -e "Enter coordinates in the format (xy)."
	echo -e "Ex: 13 (1st row and 3rd column) results as follows:\n"
	echo " | |x"
	echo "- - -"
	echo " | | "
	echo "- - -"
	echo " | | "

	echo -e "\n\n\n"

	echo "Would you like to do a test? Enter y/n"
	read testrun

	if [ $testrun == 'y' ]; then 
		echo "Enter the coordinates (xy):"
		read pos
		update_game $pos
		print_game
		clear_game
	fi

	echo -e "\n\n\n"
	echo "Game started!"

	# run game loop
	while [ $won != true ]; do
		echo -e "\n\nEnter position:"
		read pos

		update_game $pos
		print_game

		win_check

		echo "won: $won"
	done
}

function print_game () {
	echo -e "\n\n"
	echo -e "Game:\n"

	echo "$p11|$p12|$p13"
	echo "- - -"
	echo "$p21|$p22|$p23"
	echo "- - -"
	echo "$p31|$p32|$p33"
}

function update_game () {
	if [ $1 -eq "11" ]; then p11=$turn 
	elif [ $1 -eq "12" ]; then p12=$turn 
	elif [ $1 -eq "13" ]; then p13=$turn 

	elif [ $1 -eq "21" ]; then p21=$turn 
	elif [ $1 -eq "22" ]; then p22=$turn 
	elif [ $1 -eq "23" ]; then p23=$turn 

	elif [ $1 -eq "31" ]; then p31=$turn 
	elif [ $1 -eq "32" ]; then p32=$turn 
	elif [ $1 -eq "33" ]; then p33=$turn 

	else echo "Evil:PositionOutOfBoundException!!!!"
	fi
}

function clear_game () {
	p11=" " 
	p12=" " 
	p13=" " 

	p21=" " 
	p22=" " 
	p23=" " 

	p31=" " 
	p32=" " 
	p33=" " 

	echo 'Game cleared!'
}

# Represent if game has finished (someone has won)
# Return: true or false
function win_check () {
	if [ "$p11" = "$turn" ] && [ "$p12" = "$turn" ] && [ "$p13" = "$turn" ]; then won=true
	elif [ "$p21" = "$turn" ] && [ "$p22" = "$turn" ] && [ "$p23" = "$turn" ]; then won=true
	elif [ "$p31" = "$turn" ] && [ "$p32" = "$turn" ] && [ "$p33" = "$turn" ]; then won=true
                                                  
	elif [ "$p11" = "$turn" ] && [ "$p21" = "$turn" ] && [ "$p31" = "$turn" ]; then won=true
	elif [ "$p12" = "$turn" ] && [ "$p22" = "$turn" ] && [ "$p32" = "$turn" ]; then won=true
	elif [ "$p13" = "$turn" ] && [ "$p23" = "$turn" ] && [ "$p33" = "$turn" ]; then won=true
                                                  
	elif [ "$p11" = "$turn" ] && [ "$p22" = "$turn" ] && [ "$p33" = "$turn" ]; then won=true
	elif [ "$p13" = "$turn" ] && [ "$p22" = "$turn" ] && [ "$p31" = "$turn" ]; then won=true

	else won=false
	fi
}

run_game
