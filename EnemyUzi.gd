extends Area2D

onready var timer := $Bullet_Timer
onready var gun_point := $Uzi/Gun_point
onready var uzi := $Uzi
var player := []
var playerfound : PhysicsBody2D = null
var player_angle := PI /2.0
var rotation_factor := 0.1
func _ready() -> void:
	
	timer.connect("timeout",self,"_on_timeout")
	
	connect("body_entered",self,"_on_player_found")
	connect("body_exited",self,"_on_player_left")
func _on_timeout() -> void:
	if not playerfound:
		return
	var bullet := preload("res://game/Enemybullet.tscn").instance()
	add_child(bullet)
	bullet.global_transform = gun_point.global_transform
func _physics_process(_delta: float) -> void: 
	if playerfound:
		player_angle = playerfound.global_position.angle_to_point(global_position)
	uzi.rotation = lerp_angle(uzi.rotation, player_angle, rotation_factor)

func _on_player_found(body: PhysicsBody2D) -> void:
	player.append(body)
	playerfound = player[0]
	playerfound = body

func _on_player_left(body: PhysicsBody2D) -> void:
	var index := player.find(body)
	player.remove(index)
	if player:
		playerfound = player[0]
	else:
		playerfound = null
