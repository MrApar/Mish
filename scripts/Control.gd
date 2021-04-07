extends Control

onready var pan = $Panel
onready var anim = $Anim
var open = true

func toggle_inventory(_inventory):
	if open != false:
#		pan.clear()
#		pan.visible = false
		open = false
		anim.play("panelOpac2")
	else:
#		pan.visible = true
		open = true
		anim.play("panelOpac1")

func update_inventory(_inventory):
	if pan.visible:
		pan.show_invetory(_inventory)
