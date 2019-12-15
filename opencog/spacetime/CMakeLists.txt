
# The atom_types.h file is written to the build directory
INCLUDE_DIRECTORIES(${CMAKE_BINARY_DIR})

# Unit-test boilerplate.
DECLARE_GUILE_CONFIG_TARGET(SCM_CONFIG "opencog sp-config" "OPENCOG_TEST")

ADD_SUBDIRECTORY (atom-types)

ADD_SUBDIRECTORY (octomap)
ADD_SUBDIRECTORY (pointmemory)

# More unit-test boilerplate. This must be last, it depends
# the CMakefiles up above.
WRITE_GUILE_CONFIG(${GUILE_BIN_DIR}/opencog/sp-config.scm
	SCM_CONFIG TRUE)
WRITE_GUILE_CONFIG(${GUILE_BIN_DIR}/opencog/sp-config-installable.scm
	SCM_CONFIG FALSE)
INSTALL(FILES ${GUILE_BIN_DIR}/opencog/sp-config-installable.scm
	DESTINATION ${GUILE_SITE_DIR}/opencog RENAME sp-config.scm)
