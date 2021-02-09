extends KinematicBody2D

# Переменные
var is_dead = false
var vel = Vector2()
const speed = 250
const gravity = 20
const jump = 350
const flor = Vector2(0, -1)

# Движения
func _physics_process(_delta):
	if is_dead == false:
		if Input.is_action_pressed("ui_left"):
			vel.x = -speed
		elif Input.is_action_pressed("ui_right"):
			vel.x = speed
		else:
			vel.x = 0
		if Input.is_action_pressed("ui_select") and is_on_floor():
			vel.y = -jump
		if Input.is_action_pressed("ui_accept"):
			dead()
	vel.y += gravity
	vel = move_and_slide(vel, Vector2(0, -1))
	animate()

# Анимация
func animate():
	var anim = "stay"
	
	# Убираю партиклы во время прыжка
	if is_on_floor() != false:
		$Particles2D.visible = true
	else:
		$Particles2D.visible = false
		anim = "fall"
	
	# Анимация бега
	if vel.x != 0:
		anim = "runL"
		if vel.x > 0:
			anim = "runR"
		else:
			$Sprite.flip_h = false
	if $Anim.current_animation != anim:
		$Anim.play(anim)

# Смерть	
func dead():
	is_dead = true
	#$Shape.disabled = true
	vel = Vector2(0, 0)
	$Camera2D.clear_current()
	$Timer.start(1)

# Перезагрузка сценны по истечению таймера
func _on_Timer_timeout():
	get_tree().reload_current_scene()
	#get_tree().change_scene("res://Window/Menu.tscn")

# Падение из мира
func _on_Hitbox_area_entered(area):
	if area.is_in_group("fall"):
		dead()
