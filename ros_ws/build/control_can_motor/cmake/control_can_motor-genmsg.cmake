# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "control_can_motor: 1 messages, 0 services")

set(MSG_I_FLAGS "-Icontrol_can_motor:/home/pi/code/loui_robot_rasp4b_test/ros_ws/src/control_can_motor/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(control_can_motor_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/pi/code/loui_robot_rasp4b_test/ros_ws/src/control_can_motor/msg/Motor.msg" NAME_WE)
add_custom_target(_control_can_motor_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "control_can_motor" "/home/pi/code/loui_robot_rasp4b_test/ros_ws/src/control_can_motor/msg/Motor.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(control_can_motor
  "/home/pi/code/loui_robot_rasp4b_test/ros_ws/src/control_can_motor/msg/Motor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/control_can_motor
)

### Generating Services

### Generating Module File
_generate_module_cpp(control_can_motor
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/control_can_motor
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(control_can_motor_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(control_can_motor_generate_messages control_can_motor_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/code/loui_robot_rasp4b_test/ros_ws/src/control_can_motor/msg/Motor.msg" NAME_WE)
add_dependencies(control_can_motor_generate_messages_cpp _control_can_motor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(control_can_motor_gencpp)
add_dependencies(control_can_motor_gencpp control_can_motor_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS control_can_motor_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(control_can_motor
  "/home/pi/code/loui_robot_rasp4b_test/ros_ws/src/control_can_motor/msg/Motor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/control_can_motor
)

### Generating Services

### Generating Module File
_generate_module_eus(control_can_motor
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/control_can_motor
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(control_can_motor_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(control_can_motor_generate_messages control_can_motor_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/code/loui_robot_rasp4b_test/ros_ws/src/control_can_motor/msg/Motor.msg" NAME_WE)
add_dependencies(control_can_motor_generate_messages_eus _control_can_motor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(control_can_motor_geneus)
add_dependencies(control_can_motor_geneus control_can_motor_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS control_can_motor_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(control_can_motor
  "/home/pi/code/loui_robot_rasp4b_test/ros_ws/src/control_can_motor/msg/Motor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/control_can_motor
)

### Generating Services

### Generating Module File
_generate_module_lisp(control_can_motor
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/control_can_motor
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(control_can_motor_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(control_can_motor_generate_messages control_can_motor_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/code/loui_robot_rasp4b_test/ros_ws/src/control_can_motor/msg/Motor.msg" NAME_WE)
add_dependencies(control_can_motor_generate_messages_lisp _control_can_motor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(control_can_motor_genlisp)
add_dependencies(control_can_motor_genlisp control_can_motor_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS control_can_motor_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(control_can_motor
  "/home/pi/code/loui_robot_rasp4b_test/ros_ws/src/control_can_motor/msg/Motor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/control_can_motor
)

### Generating Services

### Generating Module File
_generate_module_nodejs(control_can_motor
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/control_can_motor
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(control_can_motor_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(control_can_motor_generate_messages control_can_motor_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/code/loui_robot_rasp4b_test/ros_ws/src/control_can_motor/msg/Motor.msg" NAME_WE)
add_dependencies(control_can_motor_generate_messages_nodejs _control_can_motor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(control_can_motor_gennodejs)
add_dependencies(control_can_motor_gennodejs control_can_motor_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS control_can_motor_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(control_can_motor
  "/home/pi/code/loui_robot_rasp4b_test/ros_ws/src/control_can_motor/msg/Motor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_can_motor
)

### Generating Services

### Generating Module File
_generate_module_py(control_can_motor
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_can_motor
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(control_can_motor_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(control_can_motor_generate_messages control_can_motor_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/code/loui_robot_rasp4b_test/ros_ws/src/control_can_motor/msg/Motor.msg" NAME_WE)
add_dependencies(control_can_motor_generate_messages_py _control_can_motor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(control_can_motor_genpy)
add_dependencies(control_can_motor_genpy control_can_motor_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS control_can_motor_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/control_can_motor)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/control_can_motor
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(control_can_motor_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/control_can_motor)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/control_can_motor
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(control_can_motor_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/control_can_motor)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/control_can_motor
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(control_can_motor_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/control_can_motor)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/control_can_motor
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(control_can_motor_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_can_motor)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_can_motor\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_can_motor
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(control_can_motor_generate_messages_py std_msgs_generate_messages_py)
endif()
