#!/bin/bash

source config.cfg
echo ${parts[0]}

mkdir build
cd build
mkdir stl
cd ..

cp COPYING build/

#openscad -s build/stl/frame-vertex.stl -D 'basefoot=false' parts/frame-vertex.scad
#openscad -s build/stl/frame-vertex-foot.stl parts/frame-vertex.scad

for part in ${parts[@]}
do
	openscad -s build/stl/$part.stl parts/$part.scad
done

