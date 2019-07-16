
# The atom_types.h file is written to the build directory
INCLUDE_DIRECTORIES(${CMAKE_BINARY_DIR})

DECLARE_GUILE_CONFIG_TARGET(SCM_CONFIG "opencog oc-config" "OPENCOG_TEST")

ADD_SUBDIRECTORY (spacetime)
