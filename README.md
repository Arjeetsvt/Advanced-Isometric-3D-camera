Explination of the isometric 3D camera-

First we need to go in the Kinamtic Body node under func _physics_process(delta) we have to
put a variable for the speed of the camera in line 1. This batch of code, demonstrates 
that the player is going to turn with rotation of the camera so that the moments are not affected
in any way or form.

1	var nav_speed = 0.01
2	var forward = $Cam.transform.basis.z.normalized() * nav_speed
3	if Input.is_key_pressed(KEY_W):
4		$Cam.transform.origin += -forward
5	if Input.is_key_pressed(KEY_S):
6		$Cam.transform.origin += forward
7	if Input.is_key_pressed(KEY_A):
8		$Cam.transform.origin += forward.cross(Vector3.UP) / 1.5
9	if Input.is_key_pressed(KEY_D):
10		$Cam.transform.origin += -forward.cross(Vector3.UP) / 1.5

Then Starting with line 2 we need to make a variable which will hold the physics of the movement
we'll use the "z basis" of the node where basis stands for the holder of all 3 vectors x,y and z
here, we are using the z axis for that.
The the vector is inverted for the forward moment and the backward moment.
While the cross product of those moments are used for side to side moment.

Now for the rotation of the camera-
Just make the kinmatic body node have a Spatial node and in that spatial node just type this-
func _process(delta):
	if Input.is_action_pressed("rotate_left"):
		$Playr.rotation_degrees.y -= 1
		
	if Input.is_action_pressed("rotate_right"):
		$Playr.rotation_degrees.y += 1
