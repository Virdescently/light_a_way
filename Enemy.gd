extends Area2D
var velocity := Vector2(0,0)
var drag_factor := 0.1
var speed := 350.0
var target: PhysicsBody2D = null
var target_list := []
export (float, 0.01, 1.0) var rotation_factor := 0.1


func _ready() -> void: 
	
	connect("body_entered", self, "_on_body_entered")
	
	connect("body_exited", self,"_on_body_exited")
	
func _on_body_entered(body: PhysicsBody2D) -> void:
	target_list.append(body)
	target = target_list[0]
	target = body
	
	
func _on_body_exited(body: PhysicsBody2D) -> void:
	var index := target_list.find(body)
	target_list.remove(index)
	if target_list:
		target = target_list[0]
	else:
		target = null
	

func _physics_process(delta: float) -> void:
	if not target_list:
		return
	_move(delta)
	
func _move(delta: float) -> void:
	if not target or not is_instance_valid(target):
		return
	
	position += transform.x * speed * delta
	var direction := global_position.direction_to(target.global_position) * speed
		
	var desired_velocity := speed * direction
	var steering_vector := desired_velocity - velocity
	velocity += steering_vector * drag_factor
	rotation = velocity.angle()








