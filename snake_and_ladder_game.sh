echo "...............................................WELCOME to SNAKE and LADDER game........................................................."
echo "Let's start the game"
declare -A randomCheck
player_1_start_pos=0

pos=$player_1_start_pos

NO_PLAY=1
LADDER=2
SNAKE=3
WIN_POS=100

function roll()
{
   randomCheck=$((RANDOM%6 + 1))
   echo "When we throw the die $randomCheck comes"
   ((totalrandomCheck++))
}

function check_options()
{
   option=$((RANDOM%3 + 1))
   case $option in
   $NO_PLAY)
         pos=$pos
         ;;
   $LADDER)
			pos=$(( $pos + $randomCheck ))
         ;;
   $SNAKE)
         echo "Snake"
         pos=$(( $pos - $randomCheck ))
         if [ $pos -lt $player_1_start_pos ]
         then
            pos=$player_1_start_pos
         fi
         ;;
   esac
}


while [ $pos -lt $WIN_POS ]
do
   roll
   check_options
done
