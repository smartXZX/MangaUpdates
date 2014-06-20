# Project Needs a name ofcourse
project(plasma-mangaupdates)
 
# Find the required Libaries
find_package(KDE4 REQUIRED)
include(KDE4Defaults)

install(DIRECTORY package/
        DESTINATION ${DATA_INSTALL_DIR}/plasma/plasmoids/mangaupdates)

install(FILES package/metadata.desktop
        DESTINATION ${SERVICES_INSTALL_DIR}
        RENAME plasma-applet-mangaupdates.desktop)
