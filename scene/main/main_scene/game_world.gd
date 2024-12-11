extends Node2D

const Player := preload("res://sprite/player.tscn")

var _new_GroupName := preload("res://library/group_name.gd").new()
var _new_ConvertCoord := preload("res://library/convert_coord.gd").new()


func _ready() -> void:
	_create_sprite(Player, _new_GroupName.Player, 0, 0)


func _create_sprite(prefab: PackedScene, group: String, x: int, y: int,
		x_offset: int = 0, y_offset: int = 0) -> void:
	
	var new_sprite := Player.instantiate() as Sprite2D
	new_sprite.position = Vector2(0, 0)
	new_sprite.add_to_group(group)

	add_child(new_sprite)

	new_sprite.position = _new_ConvertCoord.index_to_vector(x, y, x_offset, y_offset)
