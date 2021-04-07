extends Node2D


const gener = true

onready var item = preload("res://entity/ItemG.tscn")

func get_player():
	return $player

func _ready():
	if (gener != false):
		var items = ["apple", "seed", "bowl"]
		for _i in range(16):
			randomize()
			var a = int(rand_range(0, 3))
			var new_item = item.instance()
			$Items.add_child(new_item)
			new_item.set_item(items[a])
			new_item.position = Vector2(int(rand_range(0, 700)), 560)
		pass

func _on_Area2D_area_entered(area):
	if area.is_in_group("player"):
		$world/TileMap/TileMapFake/Area2D/Anim.play("groot_opacity")

func _on_Area2D_area_exited(_player):
	$world/TileMap/TileMapFake/Area2D/Anim.play("groot")
