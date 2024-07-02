extends KinematicBody

var speed = 15
const ACCEL_DEFAULT = 10
const ACCEL_AIR = 1
onready var accel = ACCEL_DEFAULT
var gravity = 14
var jump = 10

var snap

var veloctiy = Vector3.ZERO
var snap_vector = Vector3.DOWN
var direction = Vector3()
var velocity = Vector3()
var gravity_vec = Vector3()
var movement = Vector3()

func _physics_process(delta):
	direction = Vector3.ZERO
	var h_rot = global_transform.basis.get_euler().y
	var f_input = Input.get_action_strength("backward") - Input.get_action_strength("forward")
	var h_input = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction = Vector3(h_input, 0, f_input).rotated(Vector3.UP, h_rot).normalized()
	
	var nav_speed = 0.01
	var forward = $Cam.transform.basis.z.normalized() * nav_speed
	if Input.is_key_pressed(KEY_W):
		$Cam.transform.origin += -forward
	if Input.is_key_pressed(KEY_S):
		$Cam.transform.origin += forward
	if Input.is_key_pressed(KEY_A):
		$Cam.transform.origin += forward.cross(Vector3.UP) / 1.5
	if Input.is_key_pressed(KEY_D):
		$Cam.transform.origin += -forward.cross(Vector3.UP) / 1.5
	

	if is_on_floor():
		snap = -get_floor_normal()
		accel = ACCEL_DEFAULT
		gravity_vec = Vector3.ZERO
	else:
		snap = Vector3.DOWN
		accel = ACCEL_AIR
		gravity_vec += Vector3.DOWN * gravity * delta
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		snap = Vector3.ZERO
		gravity_vec = Vector3.UP * jump
	
	
	velocity = velocity.linear_interpolate(direction * speed, accel * delta)
	movement = velocity + gravity_vec
	
	move_and_slide_with_snap(movement, snap, Vector3.UP)
	












