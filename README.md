OpenGL-Template
Overview

Welcome to the OpenGL-Template project! This repository provides a basic template to kickstart your OpenGL-based applications.
Cloning the Repository

# To clone the repository, use the following command:
```sh
git clone https://github.com/EmomaxD/OpenGL-Template.git --recursive
```
## Important: Don't forget the --recursive flag to ensure all submodules are cloned correctly.

### If you forget to use the --recursive flag, you can initialize and update the submodules after cloning:
```sh
git submodule update --init --recursive
```

# Building the Project

## The build process is straightforward. Follow these steps:

Navigate to the Build directory:
```sh
cd Build
```
Run the build script:

```sh
./build.sh
```

# Running the Project

After building the project, return to the root directory and run the application using the following command:
```sh
./run.sh
```

# Windows

You need to run the bat files in the Build folder

```sh
cd Build

build-glfw.bat

build.bat
```

### GLEW binaries are already included for Windows

## To run the project
You have to have Visual Studio<br>
Check the OUT/ directory<br>
Open up the created solution file and set OpenGL as startup project