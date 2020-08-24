cmake_minimum_required(VERSION 3.9)

project(smpte-color-bars)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_EXPORT_COMPILE_COMMANDS 1)
set(CMAKE_AUTORCC ON)
set(PROJECT_VERSION 1.0.0)

configure_file(config.h.in config.h)
include_directories(${PROJECT_BINARY_DIR})

find_package(Qt5 5.15 REQUIRED COMPONENTS
		Core
		Quick
)

add_executable(${PROJECT_NAME} smpte.cpp resources.qrc)
target_link_libraries(${PROJECT_NAME}
	PUBLIC
		Qt5::Gui
		Qt5::Qml
		Qt5::Quick
)

include(GNUInstallDirs)
install(TARGETS ${PROJECT_NAME}
	RUNTIME
		DESTINATION ${CMAKE_INSTALL_BINDIR}
)
