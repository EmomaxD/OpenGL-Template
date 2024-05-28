cmake_minimum_required(VERSION 3.0)

# Project name
project(OpenGL)

# Define directories for third-party libraries
set(GLEW_DIR "${CMAKE_SOURCE_DIR}/Vendor/glew")
set(GLFW_DIR "${CMAKE_SOURCE_DIR}/Vendor/glfw")
set(IMGUI_DIR "${CMAKE_SOURCE_DIR}/Vendor/imgui")


# Set the output directory for all build files to 'OUT'
set(CMAKE_BINARY_DIR "${CMAKE_SOURCE_DIR}/OUT")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}")

# Add compile options
set(CMAKE_BUILD_TYPE Release)  # Set the build type to Release

# Collect all source files
file(GLOB SRC_FILES "Engine/Core/*.cpp"
                    "Engine/Renderer/*.cpp"
                    "${IMGUI_DIR}/*.cpp"
                    "${IMGUI_DIR}/backends/imgui_impl_glfw.cpp"
                    "${IMGUI_DIR}/backends/imgui_impl_opengl3.cpp"
                    )

# Define the executable target
add_executable(OpenGL ${SRC_FILES})

# Define static GLEW
add_compile_definitions(GLEW_STATIC)

# Include directories
target_include_directories(OpenGL PRIVATE 
    ${GLFW_DIR}/include 
    ${GLEW_DIR}/include
    ${IMGUI_DIR}
    ${IMGUI_DIR}/backends
    Vendor/glm/glm
)

# Link directories
if(WIN32)
    target_link_directories(OpenGL PRIVATE 
        ${GLFW_DIR}/install/lib
        ${GLEW_DIR}/Windows/lib/Release/x64
    )
elseif(UNIX)
    target_link_directories(OpenGL PRIVATE 
        ${GLFW_DIR}/install/lib 
        ${GLEW_DIR}/lib
    )
endif()

# Link libraries based on the operating system
if(WIN32)
    target_link_libraries(OpenGL PRIVATE 
        glew32s 
        glfw3 
        opengl32 
        gdi32 
        winmm
    )
elseif(UNIX)
    target_link_libraries(OpenGL PRIVATE 
        glfw3 
        GLEW 
        m 
        dl 
        pthread 
        GL
    )
else()
    message(FATAL_ERROR "Unsupported operating system")
endif()

# Set the output directory for the executable if needed
#set_target_properties(OpenGL PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Out")
