function kubepod {
	if [ $# -eq 0 ]; then
		echo usage: kubepod name
		echo example: kubepod wordpress
	else
		ret=`kubectl get pods | grep "\S*$1\S*"`
		return ret
	fi
}
