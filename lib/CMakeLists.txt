
export(EXPORT SpaceTimeTargets
	FILE "${CMAKE_CURRENT_BINARY_DIR}/SpaceTime/SpaceTimeTargets.cmake"
)

set(ConfigPackageLocation lib/cmake/SpaceTime)

install(EXPORT SpaceTimeTargets
	FILE SpaceTimeTargets.cmake
	DESTINATION ${ConfigPackageLocation}
)

include(CMakePackageConfigHelpers)

configure_package_config_file(SpaceTimeConfig.cmake.in
	${CMAKE_CURRENT_BINARY_DIR}/SpaceTimeConfig.cmake
	INSTALL_DESTINATION lib/SpaceTime/cmake
	PATH_VARS CMAKE_INSTALL_PREFIX
)

write_basic_package_version_file(
	"${CMAKE_CURRENT_BINARY_DIR}/SpaceTimeConfigVersion.cmake"
	VERSION ${SEMANTIC_VERSION}
	COMPATIBILITY SameMajorVersion
)

INSTALL(FILES
	${CMAKE_CURRENT_BINARY_DIR}/SpaceTimeConfigVersion.cmake
	${CMAKE_CURRENT_BINARY_DIR}/SpaceTimeConfig.cmake
	DESTINATION ${ConfigPackageLocation}
)
