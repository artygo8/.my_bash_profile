function gitacp {
	if [ $# -eq 0 ]; then
		echo usage: gitacp message for the commit
		echo note -- no need to use double quotes
	else
        	git pull && \
       		git add --all &&\
        	git commit -m "$*" &&\
        	git push
	fi
}
