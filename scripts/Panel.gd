extends Panel

onready var button_multi = $ButtonMulti
onready var button_set = $ButtonSet
onready var button_sing = $ButtonSing
var mish = preload("res://Window/Wind.tscn").instance()

func _on_ButtonSing_pressed():
	$Anim.play("2")
	$Load/Load2Timer.start()
	#get_tree().get_root().add_child(mish)
	#hide()

func _on_Load2Timer_timeout():
	get_tree().change_scene("res://window/Wind.tscn")

func _on_AudioStreamPlayer2D_finished():
	$Node/AudioStreamPlayer2D.play()
