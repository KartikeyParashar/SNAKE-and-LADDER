echo "...............................................WELCOME to SNAKE and LADDER game........................................................."
echo "Let's start the game"
declare -A randomCheck
player_start_pos=0

pos1=$player_start_pos
pos2=$player_start_pos

NO_PLAY=1
LADDER=2
SNAKE=3
WIN_POS=100

checkvalue=1


function roll()
{
	randomCheck=$((RANDOM%6 + 1))
	echo "When we throw the die, $randomCheck comes"
	((totalrandomCheck++))
}

function check_options()
{
	option=$(( RANDOM%3 + 1))
	case $option in
	$NO_PLAY)
			echo "No Play"
			if [ $checkvalue -eq 1 ]
			then
				pos1=$pos1
			else
				pos2=$pos2
			fi
		   ;;
	$LADDER)
			echo "Ladder"
			if [ $checkvalue -eq 1 ]
			then
				pos1=$(( $pos1 + $randomCheck ))
				if [ $pos1 -gt $WIN_POS ]
				then
					pos1=$(( $pos1 - $randomCheck ))
				fi
			else
				pos2=$(( $pos2 + $randomCheck ))
				if [ $pos2 -gt $WIN_POS ]
				then
					pos2=$(( $pos2 - $randomCheck ))
				fi
			fi
			;;
	$SNAKE)
			echo "Snake"
			if [ $checkvalue -eq 1 ]
			then
				pos1=$(( $pos1 - $randomCheck ))
				if [ $pos1 -lt $player_start_pos ]
				then
					pos1=$player_start_pos
				fi
			else
				pos2=$(( $pos2 - $randomCheck ))
				if [ $pos2 -lt $player_start_pos ]
				then
					pos2=$player_start_pos
				fi
			fi
			;;
	esac
	if [ $checkvalue -eq 1 ]
	then
		echo "Now the Player Position is : $pos1"
		echo ".........................................................................................................................."
	else
		echo "Now the Player Position is : $pos2"
		echo ".........................................................................................................................."
	fi
}

function player_turn()
{
	if [ $checkvalue -eq 1 ]
	then
		echo "Player1 turn"
		checkvalue=2
	else
		echo "Player2 turn"
		checkvalue=1
	fi
}


while [[ $pos1 -lt 100 && $pos2 -lt 100 ]]
do
	player_turn
	roll
	check_options
done
echo "The number of times the dice was played to win game is : $totalrandomCheck"
echo "player $checkvalue won"
