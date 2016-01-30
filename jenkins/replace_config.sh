#!/bin/bash
read line <&0
regexp='([A-Z_]*) (.*)'
if [[ $line =~ $regexp ]]
then
	TEMPLATE_STRING=${BASH_REMATCH[1]}
	REPLACE_STRING=${BASH_REMATCH[2]}
	sed -i "s/$TEMPLATE_STRING/$REPLACE_STRING/g" /var/jenkins_home/config.xml
else
	echo $0: not matched: $line
fi
