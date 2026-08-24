extends Area2D

var playerfound : PhysicsBody2D = null
var player := []
onready var timer := $Timer
onready var gun := $gun/Position2D
func _ready() -> void:
	connect("body_entered", self, "_on_body_entered")

func _on_body_entered(body: PhysicsBody2D) -> void:
	player.append(body)
	playerfound = player[0]
	playerfound = body
	
	
