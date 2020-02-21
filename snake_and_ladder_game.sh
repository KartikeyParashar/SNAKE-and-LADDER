echo "...............................................WELCOME to SNAKE and LADDER game........................................................."
echo "Let's start the game"

declare -A randomCheck

player_1_start_pos=0

pos=$player_1_start_pos

NO_PLAY=1
LADDER=2
SNAKE=3

function roll()
{
   randomCheck=$((RANDOM%6 + 1))
   echo "When we throw the die $randomCheck comes"
   ((totalrandomCheck++))
}

function check_options()
{
   option=$(( RANDOM % 3 ))
   case $option in
   $NO_PLAY)
         echo "No Play"
         pos=$pos
         ;;
   $LADDER)
         echo "Ladder"
         pos=$(( $pos + $randomCheck ))
         ;;
   $SNAKE)
         echo "Snake"
         pos=$(( $pos - $randomCheck ))
         ;;
   esac
}

