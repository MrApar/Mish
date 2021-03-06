extends RigidBody2D


var item = ""
var amount = 1

func set_item(item_name):
	$Sprite.texture = load("res://sprites/Items/%s.png" % item_name)
	item = item_name

func get_item():
	return item

func get_amount():
	return amount

func _input(event):
	if event.is_action_pressed("e_click"):
		var pl = get_parent().get_parent().get_player()
		if abs(pl.position.x - position.x) < 40 and abs(pl.position.y - position.y) < 40:
			get_parent().remove_child(self)
			pl.pick(self)


func _on_Area2D_area_entered(area):
	if area.is_in_group("player"):
		$AnimationPlayer.play("E")

func _on_Area2D_area_exited(_player):
	$AnimationPlayer.play("par")
