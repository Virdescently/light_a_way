extends Node2D
onready var finishspot := $"Finish area"
onready var player := $Player
onready var info := $CanvasLayer/Label
onready var enemies := $Enemies
onready var playercam := $Player/Camera2D

func _ready() -> void:
	finishspot.connect("body_entered",self,"_on_finish_body_entered")

func nextlvl() -> void:
	get_tree().change_scene("res://game/lvl2/Gamelvl2.tscn")
func _on_finish_body_entered(body:Node) -> void:
	nextlvl()
	
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("r"):
		get_tree().reload_current_scene()


