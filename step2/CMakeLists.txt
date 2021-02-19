cmake_minimum_required(VERSION 3.10)

# set the project name
project(Tutorial VERSION 1.0)
message(${PROJECT_BINARY_DIR})

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)
configure_file(TUTorialConfig.h.in TutorialConfig.h)
# add the executable
if (USE_MYMATH)
	add_subdirectory(MathFunctions)
	list(APPEND EXTRA_LIBS MathFunctions)
	list(APPEND EXTRA_INCLUDES "${PROJECT_SOURCE_DIR}/MathFunctions")
endif()
add_executable(Tutorial main.cpp)
target_include_directories(Tutorial PUBLIC 
	"${PROJECT_BINARY_DIR}"
	${EXTRA_INCLUDES}
	)
target_link_libraries(Tutorial PUBLIC ${EXTRA_LIBS})

