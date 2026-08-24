extends Area2D

export var speed := 10 
onready var timer := $Timer
var player := []
var playerfound : PhysicsBody2D = null
func _ready() -> void:
	timer.connect("timeout", self, "_on_timeout")
	connect("body_entered",self,"_on_bullet_hit")
func _on_timeout() -> void:
	explode()
	
func _on_bullet_hit(body: PhysicsBody2D) -> void:
	player.append(body)
	playerfound = player[0]
	playerfound = body
	print("shoot?")
	playerfound.queue_free()
func _physics_process(delta: float) -> void:
	_move(delta)
	
func _move(delta:float) -> void:
	self.global_position += transform.x * speed
	
func explode() -> void:
	queue_free()
