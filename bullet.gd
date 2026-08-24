extends Area2D


onready var timer := $bullet_Timer
export var speed := 10.0
func _ready() -> void:
	timer.connect("timeout", self, "_on_Timer_timeout")

	
func _on_Timer_timeout() -> void:
	#print("timer timed out")
	explode()

func _physics_process(delta: float) -> void:

	_move(delta)
	
	#print("_move")

func _move(delta:float) -> void:
	#print("work?")
	self.global_position += transform.x * speed
	#print(self.global_position)

func explode() -> void:
	print("explode is called")
	queue_free()
