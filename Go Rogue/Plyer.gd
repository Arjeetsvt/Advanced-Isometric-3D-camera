extends Spatial



func _process(delta):
	if Input.is_action_pressed("rotate_left"):
		$Playr.rotation_degrees.y -= 1
		
	if Input.is_action_pressed("rotate_right"):
		$Playr.rotation_degrees.y += 1

#Desen't work currently 

func _input(_event):
	var nav_speed = 0.01
	if Input.is_action_just_pressed("zoom_in"):
		if $Playr/Cam/Camera.size>5:
			$Playr/Cam/Camera.size -= 1
			nav_speed = $Playr/Cam/Camera.size / 100
			
			_adjust_viewport_size()
	if Input.is_action_just_pressed("zoom_out"):
		if Input.is_action_just_pressed("zoom_in"):
			if $Playr/Cam/Camera.size<100:
				$Playr/Cam/Camera.size += 1
				nav_speed = $Playr/Cam/Camera.size / 100
				print(nav_speed)
				
				_adjust_viewport_size()
			
func _adjust_viewport_size():
	var viewport_resolution
	var viewport_resolution_variance
	viewport_resolution.x = ($Playr/Cam/Camera.size / 100) * viewport_resolution_variance
	viewport_resolution.y = ($Playr/Cam/Camera.size / 100) * viewport_resolution_variance
	
	print(Vector2(viewport_resolution.x,viewport_resolution.y))
	
	#get_tree().get_root().get_size(Vector2(viewport_resolution.x,viewport_resolution.y))
