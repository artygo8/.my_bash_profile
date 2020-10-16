basedir=${MY_BASH_PROFILE_DIR:-~/.my_bash_profile/srcs}
export USER42=${USER42:-agossuin}

utils=("kubernetes" "git" "aliasses" "42header")

for item in ${utils[@]}; do
	source ${basedir}/${item}.sh
done
