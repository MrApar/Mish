extends Panel

onready var button_multi = $ButtonMulti
onready var button_set = $ButtonSet
onready var button_sing = $ButtonSing
var mish = preload("res://Window/Wind.tscn").instance()

func _on_ButtonSing_pressed():
	get_tree().change_scene("res://Window/Wind.tscn")
	#get_tree().get_root().add_child(mish)
	#hide()
