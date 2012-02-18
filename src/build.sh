#!/bin/bash

# We require thingdoc to build the documentation along with the distribution. 
# We require thingdoc to be installed in the thingdoc directory; if it's not found, we'll attempt to download it via git. 

if [ ! -e "thingdoc" ] ; then
	echo "Thingdoc not found in thingdoc/ . Trying to fetch that from github"
	git clone git://github.com/prusajr/ThingDoc.git thingdoc
	if [ ! -e "thingdoc" ] ; then
		echo "FATAL: Thingdoc could not be installed via git." 
		echo "Please download https://github.com/prusajr/ThingDoc"	
		echo "Put the downloaded folder in the current directory and rename it to lower-case letters: thingdoc"	
		exit	
	fi
fi

# If the first argument is supplied, it will use this file as config file
# otherwise, it will load config.cfg by default

if [ -n "$1" ]; then
	config_file="$1"
else
	config_file="config.cfg"
fi

# now we know what config file we should load, so we check if it exists.
if [ ! -e $config_file ]; then
	echo "FATAL: Config file $1 does not exist."	
	exit
fi

echo "Using config file $config_file"
source $config_file

# make base directory structure
mkdir build
cd build
mkdir stl
cd ..
# copy GPL license to build
cp COPYING build/
# copy confiuration to build
cp $config_file build/

declare thingdoc_parts 
for part in ${parts[@]}
do
	openscad -s build/stl/$part.stl parts/$part.scad
	thingdoc_parts="$thingdoc_parts $part"
done
#echo $thingdoc_parts	
thingdoc/thingdoc -o build/ -i parts/ --parse-only common.tdoc reprap.tdoc $thingdoc_parts










