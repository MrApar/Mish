extends Sprite

var arrow_speed = 400
var arrow = preload("res://arrow.tscn")

func _physics_process(delta):
	if Input.is_action_pressed("LMB"):
			fire_bow()
	look_at(get_global_mouse_position())

func fire_bow():
	var arrow_inst = arrow.instance()
	arrow_inst.position = get_global_position()
	arrow_inst.rotation_degrees = rotation_degrees
	arrow_inst.apply_impulse(Vector2(),Vector2(arrow_speed,0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child",arrow_inst)
	#if arrow == is_on_floor():
	#	pass
