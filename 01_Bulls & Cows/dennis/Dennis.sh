#!/bin/bash

#set the initial values
COWS=0
BULLS=0

function start {
TB=0
TC=0
#generate the number that the user will need to guess
N=$(for (( i=1;i<=9;i++ )) do echo $RANDOM $i; done|sort -k1|cut -d" " -f2|head -4)
A1="$(echo $N | cut -d" " -f1)"
A2="$(echo $N | cut -d" " -f2)"
A3="$(echo $N | cut -d" " -f3)"
A4="$(echo $N | cut -d" " -f4)"

#uncomment this to cheat
#echo "answer: $A1$A2$A3$A4"

#get the users guess
echo "What four digit number am I thinking of?"
read G

#validate that guess as a proper guess
	((GM=G*1))
	if [[ $GM != $G ]]
	then
   		echo "Come on man! That's not even a number!"
   		echo ""
   		start
	fi

	if [[ $G -gt 9999 ]]
	then
		echo "Your number is a bit too big there bro."
		echo "Try to limit your number to four digits."
		echo ""
		start
	fi

	if [[ $G -lt 1000 ]]
	then
		echo "Your number is a bit too small there bro."
		echo "Try to limit your number to four digits."
		echo ""
		start
	fi

#set each digit as a variable to use next
D1="$(echo ${G:0:1})"
D2="$(echo ${G:1:1})"
D3="$(echo ${G:2:1})"
D4="$(echo ${G:3:1})"

#a few more final checks to make sure the guesses are valid and make sense
	if [[ $D1 == 0 ]] || [[ $D2 == 0 ]] || [[ $D3 == 0 ]] || [[ $D4 == 0 ]]
	then
		echo "The answer will not include any zeros, so guesing them is not wise."
		echo "Lets try this again but without any zeros in your guess this time."
		echo ""
		start
	fi

	if [[ $D1 == $D2 ]] || [[ $D1 == $D3 ]] || [[ $D1 == $D4 ]] || [[ $D2 == $D3 ]] || [[ $D2 == $D4 ]] || [[ $D3 == $D4 ]]
	then
		echo "Your guess needs to be only contain unique digits."
		echo "Try again with four unique digits."
		echo ""
		start
	fi

#calculate the score (in a very sloppy manner)
if [[ $D1 == $A1 ]]; then
	((TB++))
	((BULLS++))
elif [[ $D1 == $A2 ]] || [[ $D1 == $A3 ]] || [[ $D1 == $A4 ]]; then
	((TC++))
	((COWS++))
fi
if [[ $D2 == $A2 ]]; then
	((TB++))
	((BULLS++))
elif [[ $D2 == $A1 ]] || [[ $D2 == $A3 ]] || [[ $D2 == $A4 ]]; then
	((TC++))
	((COWS++))
fi
if [[ $D3 == $A3 ]]; then
	((TB++))
	((BULLS++))
elif [[ $D3 == $A2 ]] || [[ $D3 == $A1 ]] || [[ $D3 == $A4 ]]; then
	((TC++))
	((COWS++))
fi
if [[ $D4 == $A4 ]]; then
	((TB++))
	((BULLS++))
elif [[ $D4 == $A2 ]] || [[ $D4 == $A3 ]] || [[ $D4 == $A1 ]]; then
	((TC++))
	((COWS++))
fi

#print out the users score for this round
if [[ $TB -eq 4 ]]; then
	echo ""
	echo "Yeah! You got it right!"
	echo "That was the exact number I thought of!"
	echo "You got all four Bulls this round!"
	echo ""
elif [[ $TC -gt 0 ]] || [[ $TB -gt 0 ]]; then
	echo ""
	echo "Good Job!"
	echo "You got $TB Bull(s) and $TC Cow(s) this round!"
	echo ""
else
	echo ""
	echo "You didn't get any right..."
	echo "you're really not too good at this are you?"
	echo ""
fi

#print the total scores and see if the player wants to keep going
echo "Total Bulls: $BULLS"
echo "Total Cows: $COWS"
echo ""
echo "Wanna play again? (y/n)"
	read yn
	case $yn in
        [Yy]* ) start;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
}

start
