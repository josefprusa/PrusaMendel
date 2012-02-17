#!/bin/bash

mkdir build
cd build
mkdir stl
cd ..

cp COPYING build/

openscad -s build/stl/frame-vertex.stl -D 'basefoot=false' parts/frame-vertex.scad


