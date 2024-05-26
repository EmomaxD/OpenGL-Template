#!/bin/bash

./required.sh
./build-glew.sh
./build-glfw.sh

cmake .
make 