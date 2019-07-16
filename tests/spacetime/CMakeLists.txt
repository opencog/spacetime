# The atom_types.h file is written to the build directory
INCLUDE_DIRECTORIES(${CMAKE_BINARY_DIR})

LINK_LIBRARIES(
	atom_octomap
	${ATOMSPACE_LIBRARIES}
	${COGUTIL_LIBRARY}
)
ADD_CXXTEST(AtomOcTreeUTest)
ADD_CXXTEST(OctoValueUTest)
ADD_CXXTEST(TimeSpaceAtomUTest)
