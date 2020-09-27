#!/bin/bash
destinations=(".profile" ".bashrc")
command="source ~/.my_bash_profile/srcs/main.sh"

test=0
for dest in ${destinations[@]}; do
	if [ -f ~/$dest ]; then
		test=1;
		if [ -z "`cat ~/$dest | grep "$command"`" ]; then
			echo $command >> ~/$dest;
		fi
	fi
done

if [ $test == 0 ]; then
	touch ~/.bashrc;
	echo $command >> ~/.bashrc;
fi

echo 'Installation completed, restart the terminal to apply the changes';
