function kubepod {
	if [ $# -eq 0 ]; then
		echo usage: kubepod name
		echo example: kubepod wordpress
	else
		kubectl get pods | grep -o "\S*$1\S*"
	fi
}
