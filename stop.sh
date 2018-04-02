#!/bin/bash

echo "

"

while :
do
	echo "Are you sure you want to Stop the ELK Stack? (Y/N):"
	read INPUT_CHOICE
	INPUT_CHOICE=`echo $INPUT_CHOICE | tr [:lower:] [:upper:]`

	case $INPUT_CHOICE in
		Y)
			echo "Deleting ELK Stack..."
			echo "
			"
			cd Stack/`cat /tmp/ELK_Stack` && docker-compose down
			break
			;;
		N)
			exit 1
			;;
		*)
			echo "Invalid Choice!! Try again"
			;;
	esac
done
