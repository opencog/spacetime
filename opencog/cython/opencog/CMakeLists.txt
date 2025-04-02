
# Need to use -fno-strict-aliasing when compiling cython code, in order
# to avoid nasty compiler warnings about aliasing.  Cython explicitly
# performs aliasing, in order to emulate python object inheritance.
# See, for example,
# https://groups.google.com/forum/#!topic/cython-users/JV1-KvIUeIg
#
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-strict-aliasing")

INCLUDE_DIRECTORIES(
	${ATOMSPACE_INCLUDE_DIR}
	${Python3_INCLUDE_DIRS}
	${CMAKE_CURRENT_SOURCE_DIR}
	${CMAKE_CURRENT_BINARY_DIR}
)

SET(CYTHON_FLAGS "-3" "-f" "-Wextra" # "-Werror"
	"-I" "${ATOMSPACE_INCLUDE_DIR}/opencog/cython"
	"-I" "${ATOMSPACE_INCLUDE_DIR}/opencog/cython/opencog")

# Use this as a guide:
# https://github.com/OpenKinect/libfreenect/blob/master/wrappers/python/CMakeLists.txt

##################### SpaceTime Types ##################

CYTHON_ADD_MODULE_PYX(spacetime
	"spacetime_types.pyx"
)

list(APPEND ADDITIONAL_MAKE_CLEAN_FILES "spacetime_types.cpp")

# opencog.spacetime Python bindings
INCLUDE_DIRECTORIES(${CMAKE_BINARY_DIR})

ADD_LIBRARY(spacetime_cython SHARED
	spacetime.cpp
)

ADD_DEPENDENCIES(spacetime_cython spacetime-types)

TARGET_LINK_LIBRARIES(spacetime_cython
	${NO_AS_NEEDED}
	spacetime-types
	${ATOMSPACE_LIBRARIES}
	${Python3_LIBRARIES}
)

SET_TARGET_PROPERTIES(spacetime_cython PROPERTIES
	PREFIX ""
	OUTPUT_NAME spacetime)

INSTALL (TARGETS spacetime_cython
	DESTINATION "${PYTHON_DEST}")
