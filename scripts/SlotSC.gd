extends Panel



var ItemCalss = preload("res://entity/Item.tscn")
var item = null

func _ready():
	if randi() % 2 == 0:
		item = ItemCalss.instance()
		add_child(item)
