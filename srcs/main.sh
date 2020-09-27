basedir=~/.my_bash_profile/srcs
utils=("kubernetes" "git" "aliasses")

for item in ${utils[@]}; do
	source ${basedir}/${item}.sh
done
