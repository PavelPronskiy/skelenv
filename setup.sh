#!/usr/bin/env bash


_fetch() {
	echo "Fetch file: ${1}"
	#wget 
}

#_fetch

if [ -z "$1" ]
then
	grep -q 'skelenv$' ${HOME}/.bashrc \
	&& echo ".skelenv already exists on file: ${HOME}/.bashrc" \
	|| {
		echo "Installing .skelenv include to ${HOME}/.bashrc"
		echo '. ${HOME}/.skelenv' >> ${HOME}/.bashrc
	}
fi

