extends ColorRect


onready var Anim = $Control/Anim


func _on_AnimationPlayTimer_timeout():
	$ChangeSceneTimer.start()
	Anim.play("1")

func _on_ChangeSceneTimer_timeout():
	get_tree().change_scene("res://window/Menu.tscn")
