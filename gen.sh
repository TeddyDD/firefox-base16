#!/bin/sh

conv(){
	echo $(curl -sS --request POST \
         --url http://127.0.0.1:1880/fromtheme \
         --header 'content-type: text/yaml' \
         --data "$(cat $@)")
}

files=$(find -type f -path '*schemes/*.yaml')

for f in $files; do
	printf -- '- [%s](%s)\n'  "$(basename $f .yaml)" "$(conv $f)"
done
