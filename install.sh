#/bin/bash
destinations=(".profile" ".bashrc" ".zshrc")
command="source ~/.my_bash_profile/main.sh"

test=0
for dest in ${destinations[@]}; do
	if [ -f ~/$dest ]; then
		test=1;
		if [ -z "`cat ~/$dest | grep "$command"`" ]; then
			echo $command >> ~/$dest;
			source ~/$bashrc
		fi
	fi
done

if [ $test == 0 ]; then
	touch ~/.bashrc;
	echo $command >> ~/.bashrc;
	source ~/.bashrc
fi

echo 'Installation completed, restart the other terminals to apply the changes';
