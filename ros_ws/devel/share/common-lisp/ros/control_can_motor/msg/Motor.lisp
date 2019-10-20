; Auto-generated. Do not edit!


(cl:in-package control_can_motor-msg)


;//! \htmlinclude Motor.msg.html

(cl:defclass <Motor> (roslisp-msg-protocol:ros-message)
  ((motor_id
    :reader motor_id
    :initarg :motor_id
    :type cl:fixnum
    :initform 0)
   (current
    :reader current
    :initarg :current
    :type cl:fixnum
    :initform 0)
   (velocity
    :reader velocity
    :initarg :velocity
    :type cl:fixnum
    :initform 0)
   (position
    :reader position
    :initarg :position
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Motor (<Motor>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Motor>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Motor)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name control_can_motor-msg:<Motor> is deprecated: use control_can_motor-msg:Motor instead.")))

(cl:ensure-generic-function 'motor_id-val :lambda-list '(m))
(cl:defmethod motor_id-val ((m <Motor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader control_can_motor-msg:motor_id-val is deprecated.  Use control_can_motor-msg:motor_id instead.")
  (motor_id m))

(cl:ensure-generic-function 'current-val :lambda-list '(m))
(cl:defmethod current-val ((m <Motor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader control_can_motor-msg:current-val is deprecated.  Use control_can_motor-msg:current instead.")
  (current m))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <Motor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader control_can_motor-msg:velocity-val is deprecated.  Use control_can_motor-msg:velocity instead.")
  (velocity m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <Motor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader control_can_motor-msg:position-val is deprecated.  Use control_can_motor-msg:position instead.")
  (position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Motor>) ostream)
  "Serializes a message object of type '<Motor>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'motor_id)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'current)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'velocity)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'position)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Motor>) istream)
  "Deserializes a message object of type '<Motor>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'motor_id)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'current) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'velocity) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'position) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Motor>)))
  "Returns string type for a message object of type '<Motor>"
  "control_can_motor/Motor")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Motor)))
  "Returns string type for a message object of type 'Motor"
  "control_can_motor/Motor")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Motor>)))
  "Returns md5sum for a message object of type '<Motor>"
  "37986fc1a8f0287c7889edd26eaf11a1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Motor)))
  "Returns md5sum for a message object of type 'Motor"
  "37986fc1a8f0287c7889edd26eaf11a1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Motor>)))
  "Returns full string definition for message of type '<Motor>"
  (cl:format cl:nil "uint8 motor_id~%int16 current~%int16 velocity~%int16 position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Motor)))
  "Returns full string definition for message of type 'Motor"
  (cl:format cl:nil "uint8 motor_id~%int16 current~%int16 velocity~%int16 position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Motor>))
  (cl:+ 0
     1
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Motor>))
  "Converts a ROS message object to a list"
  (cl:list 'Motor
    (cl:cons ':motor_id (motor_id msg))
    (cl:cons ':current (current msg))
    (cl:cons ':velocity (velocity msg))
    (cl:cons ':position (position msg))
))
