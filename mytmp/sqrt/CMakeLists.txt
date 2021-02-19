add_executable(main main.cpp)
message(${PROJECT_BINARY_DIR})
target_link_libraries(main  yyy)
target_link_libraries(main  xxx)
target_include_directories(main PUBLIC
                             "${PROJECT_BINARY_DIR}"
                             )
						 

add_library(xxx STATIC  myadd.cpp)
add_library(yyy  myaddex.cpp)
#set_target_properties(xxx PROPERTIES POSITION_INDEPENDENT_CODE  ${BUILD_SHARED_LIBS})
set_target_properties(xxx PROPERTIES POSITION_INDEPENDENT_CODE  1)

target_link_libraries(yyy PRIVATE xxx)

target_include_directories(yyy PUBLIC
                             "${PROJECT_BINARY_DIR}"
                             )



