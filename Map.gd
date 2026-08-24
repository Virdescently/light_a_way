extends YSort
const TOWERS := [
	preload("res://game/tower1.tscn"),
	preload("res://game/tower2.tscn"),
	preload("res://game/tower3.tscn")
	
]
onready var towers : TileMap = $Mask
func get_random_towers() -> Sprite:
	var tower_random_index := randi() % TOWERS.size()
	return TOWERS[tower_random_index].instance()
func add_tower_on_game() -> void:
	for cell in towers.get_used_cells():
		var tower := get_random_towers()
		add_child(tower)
		var tower_size := tower.scale * tower.texture.get_size()
		var space := towers.cell_size - tower_size
		var random_offset := Vector2(randf(), randf()) * space
		tower.position = towers.position + towers.map_to_world(cell) + random_offset
func _ready() -> void:
	randomize()
	add_tower_on_game()
	towers.visible = false
	
