;; Auto-generated. Do not edit!


(when (boundp 'control_can_motor::Motor)
  (if (not (find-package "CONTROL_CAN_MOTOR"))
    (make-package "CONTROL_CAN_MOTOR"))
  (shadow 'Motor (find-package "CONTROL_CAN_MOTOR")))
(unless (find-package "CONTROL_CAN_MOTOR::MOTOR")
  (make-package "CONTROL_CAN_MOTOR::MOTOR"))

(in-package "ROS")
;;//! \htmlinclude Motor.msg.html


(defclass control_can_motor::Motor
  :super ros::object
  :slots (_motor_id _current _velocity _position ))

(defmethod control_can_motor::Motor
  (:init
   (&key
    ((:motor_id __motor_id) 0)
    ((:current __current) 0)
    ((:velocity __velocity) 0)
    ((:position __position) 0)
    )
   (send-super :init)
   (setq _motor_id (round __motor_id))
   (setq _current (round __current))
   (setq _velocity (round __velocity))
   (setq _position (round __position))
   self)
  (:motor_id
   (&optional __motor_id)
   (if __motor_id (setq _motor_id __motor_id)) _motor_id)
  (:current
   (&optional __current)
   (if __current (setq _current __current)) _current)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:serialization-length
   ()
   (+
    ;; uint8 _motor_id
    1
    ;; int16 _current
    2
    ;; int16 _velocity
    2
    ;; int16 _position
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _motor_id
       (write-byte _motor_id s)
     ;; int16 _current
       (write-word _current s)
     ;; int16 _velocity
       (write-word _velocity s)
     ;; int16 _position
       (write-word _position s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _motor_id
     (setq _motor_id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; int16 _current
     (setq _current (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _velocity
     (setq _velocity (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _position
     (setq _position (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get control_can_motor::Motor :md5sum-) "37986fc1a8f0287c7889edd26eaf11a1")
(setf (get control_can_motor::Motor :datatype-) "control_can_motor/Motor")
(setf (get control_can_motor::Motor :definition-)
      "uint8 motor_id
int16 current
int16 velocity
int16 position

")



(provide :control_can_motor/Motor "37986fc1a8f0287c7889edd26eaf11a1")


