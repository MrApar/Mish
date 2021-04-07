extends NinePatchRect

onready var item = preload("res://entity/InvetoryItem.tscn")
onready var container = $Scroll/Grid

func _ready():
	clear()
	visible = true

func clear():
	for i in container.get_children():
		container.remove_child(i)
		i.queue_free()

func show_invetory(inventory):
	clear()
	for i in inventory.keys():
		var new_item = item.instance()
		container.add_child(new_item)
		new_item.set_item(i, inventory[i])
