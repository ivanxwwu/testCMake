
add_executable(MakeTable MakeTable.cxx)
message(${CMAKE_CURRENT_BINARY_DIR})
message(${CMAKE_BINARY_DIR})
message(${CMAKE_CURRENT_SOURCE_DIR})

add_library(MathFunctions  
	mysqrt.cxx
	${CMAKE_CURRENT_BINARY_DIR}/Table.h)
target_include_directories(MathFunctions
          INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}
		  PRIVATE ${CMAKE_BINARY_DIR}
		  PRIVATE ${CMAKE_CURRENT_BINARY_DIR}
          )

add_custom_command(
  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/Table.h
  COMMAND MakeTable ${CMAKE_CURRENT_BINARY_DIR}/Table.h
  DEPENDS MakeTable
)
install(TARGETS MathFunctions DESTINATION lib)
install(FILES mysqrt.h DESTINATION include)
