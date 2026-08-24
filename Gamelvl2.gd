extends Node2D
onready var Home := $Home
onready var player := $Player
onready var info := $CanvasLayer/Label
onready var enemies := $Enemies
onready var playercam := $Player/Camera2D

func _ready() -> void:
	
	Home.connect("body_entered",self,"_on_home")
	
func finishgame() -> void:
	
	set_process(false)
	player.set_physics_process(false)
	enemies.set_physics_process(false)
	info.rect_scale = Vector2.ONE
	info.get_font("font").size = 128
	info.show()
	info.text = "Winner"
func _on_home(body:Node) -> void:
	finishgame()
func _physics_process(_delta:float) ->void:
	if Input.is_action_just_pressed("r"):
		get_tree().reload_current_scene()
