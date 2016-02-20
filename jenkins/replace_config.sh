#!/bin/bash
set +x

(
read line <&0
regexp='([^ ]*) ([A-Z0-9_]*) (.*)'
if [[ $line =~ $regexp ]]
then
	FILENAME_STRING=${BASH_REMATCH[1]}
	TEMPLATE_STRING=${BASH_REMATCH[2]}
	REPLACE_STRING=${BASH_REMATCH[3]}
	sed -i "s/$TEMPLATE_STRING/$REPLACE_STRING/g" $FILENAME_STRING
else
	echo $0: not matched: $line
fi
) >> /tmp/file_updater_log
