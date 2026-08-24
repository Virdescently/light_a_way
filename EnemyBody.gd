extends Area2D
var playerfound:PhysicsBody2D = null
var player := []

func _ready() -> void:
	connect("body_entered", self, "_player_entered")

	

func _player_entered(body: PhysicsBody2D) -> void:
	

	player.append(body)
	playerfound = player[0]
	playerfound = body
	print("ok")
	playerfound.queue_free()

