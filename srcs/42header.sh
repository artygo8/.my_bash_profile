USER42=${USER42:-name}
MAIL="$USER42@student.s19.be"

BLANK='                                                                                     '
FIRST_LINE='/* ************************************************************************** */'
BY="By: $USER42 <$MAIL>$BLANK"
DATE="`date '+%Y/%m/%d %H:%M:%S'`"
CREAT="Created: $DATE by $USER42 $BLANK"
UPDAT="Updated: $DATE by $USER42 $BLANK"


function 42header {

	if [ -z $# ]; then
		echo "Usage: Set 42 header if not present in C files"
		echo "Example: \"42header *.c\""
	fi
	rm -f tmp.header
	for i in $@; do
		NAME="$i$BLANK"
		echo "file to be modified is $i"
		if [ -z `cat $i | grep -F "$FIRST_LINE"` ] && [ -f $i ]; then

			rm -f tmp.header
			echo "$FIRST_LINE" >> tmp.header
			echo '/*'"${BLANK::76}"'*/' >> tmp.header
			echo '/*'"${BLANK::48}""        :::      ::::::::   "'*/' >> tmp.header
			echo '/*'"   ${NAME::45}""      :+:      :+:    :+:   "'*/' >> tmp.header
			echo '/*'"${BLANK::48}""    +:+ +:+         +:+     "'*/' >> tmp.header
			echo '/*'"   ${BY::45}""  +#+  +:+       +#+        "'*/' >> tmp.header
			echo '/*'"${BLANK::48}""+#+#+#+#+#+   +#+           "'*/' >> tmp.header
			echo '/*'"   ${CREAT::45}""     #+#    #+#             "'*/' >> tmp.header
			echo '/*'"   ${UPDAT::45}""    ###   ########.fr       "'*/' >> tmp.header
			echo '/*'"${BLANK::76}"'*/' >> tmp.header
			echo "$FIRST_LINE" >> tmp.header
			echo  >> tmp.header
			cat tmp.header $i > new && mv new $i

		elif [ -f $i ]; then
			echo "//!\\\\ Header is already in the file: \"$@\""
		else
			echo "//!\\\\ no such a file: \"$@\""
		fi
		rm -f tmp.header
	done
}
