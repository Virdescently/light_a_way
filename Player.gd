extends KinematicBody2D


const DIRECTION_TO_FRAME := {
	Vector2.DOWN: 0,
	Vector2.DOWN + Vector2.RIGHT: 9,
	Vector2.RIGHT: 9,
	Vector2.UP + Vector2.RIGHT: 9,
	Vector2.UP: 22,
}

var normal_SPEED := 350.0
var sprint := 1500
var drag_factor := 0.13
var velocity := Vector2.ZERO
var max_speed := normal_SPEED
onready var sprite := $character
onready var uzi :=$GunManager/Uzi

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var mousedirection := (get_global_mouse_position() - global_position).normalized()
	if Input.is_action_just_pressed("shift"):
		max_speed = sprint
		get_node("Timer").start()
	var desired_velocity := max_speed * direction
	var steering_vector := desired_velocity - velocity
	velocity += steering_vector * drag_factor
	velocity = move_and_slide(velocity)
	
	var direction_key := direction.round()
	
	
	direction_key.x = abs(direction_key.x)
	

	if direction_key in DIRECTION_TO_FRAME:
		sprite.frame = DIRECTION_TO_FRAME[direction_key]
		sprite.flip_h = sign(direction.x) == -1
		
	uzi.rotation = mousedirection.angle()
	
	if Input.is_action_just_pressed("shoot"):
		#print("player is shooting his uzi")
		uzi.shoot() 
	
func _on_Timer_timeout():
	max_speed = normal_SPEED
