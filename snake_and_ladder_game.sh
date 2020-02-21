echo "...............................................WELCOME to SNAKE and LADDER game........................................................."
echo "Let's start the game"


function roll()
{
   randomCheck=$((RANDOM%6 + 1))
   echo "When we throw the die $randomCheck comes"
   ((totalrandomCheck++))
}

