extends Node2D
onready var timer := $timer
onready var gun_point := $Sprite/Position2D 

func _physics_process(delta:float) -> void:
	var mouse_position := (get_global_mouse_position() - global_position).normalized()
	rotation = mouse_position.angle()
	#if Input.is_action_just_pressed("test"):
		#shoot()
	
func shoot() -> void:
	#print("shoot is being called")
	var bullet = preload("res://game/bullet.tscn").instance()
	get_tree().get_root().add_child(bullet)

	bullet.global_position = gun_point.global_position
	bullet.rotation = rotation
	
	
	#New idea sadly i did not think about this earlier but what if I just used 
	#camera2d seperate between 2 view points and have the camera switch to the
	#player and the bullet 
