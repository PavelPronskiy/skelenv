#!/usr/bin/env bash

# date created: 12.05.2018
# setup skelenv environment

if [ -z "$1" ]
then
	timestamp=`date +%s`
	fskelenv=`wget -qO- https://raw.githubusercontent.com/PavelPronskiy/skelenv/master/.skelenv?${timestamp}`

	echo "Installing .skelenv include to ${HOME}/.bashrc"

	if [ -e "${HOME}/.bashrc" ]
	then
		grep -q 'skelenv$' ${HOME}/.bashrc \
		&& echo ".skelenv already exists on file: ${HOME}/.bashrc" \
		|| {
			echo "${fskelenv}" > ${HOME}/.skelenv
			echo '. ${HOME}/.skelenv' >> ${HOME}/.bashrc
		}
	else
		echo "${fskelenv}" > ${HOME}/.skelenv
		echo '. ${HOME}/.skelenv' > ${HOME}/.bashrc
	fi
	
	echo "Init new environment"
	. ${HOME}/.bashrc
else
	echo "$0 script dont use args"
fi

