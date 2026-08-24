extends CanvasLayer

#Change menu to game lvl 
func nextlvl() -> void:
	get_tree().change_scene("res://game/lvl1/Gamelvl1.tscn")
func  _physics_process(delta:float)-> void:
	if Input.is_action_just_pressed("enter"):
		nextlvl()
