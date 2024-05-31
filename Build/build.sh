#!/bin/bash

./required.sh
./build-glew.sh
./build-glfw.sh

cd ..

cmake -S . -B OUT/

cd OUT

make