extends KinematicBody2D

# Переменные
onready var ui = get_viewport().get_node("Wind/UI/Control") # Ссылка на интерфейс

var wait = true
var is_dead = false
var vel = Vector2()
#var inertia = 100
var inventory = {}
var items = 0

const speed = 250
const gravity = 20
const jump = 350
const flor = Vector2(0, -1)


func _on_WaitTimer_timeout():
	wait = false


# Движения + физика
func _physics_process(_delta):
	if is_dead == false and wait == false:
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
	vel = move_and_slide(vel, Vector2.UP, false, 1123, PI/123) #, false, 4, PI/4, false
	# Физика для объектов
#	for index in get_slide_count():
#		var collision = get_slide_collision(index)
#		if collision.collider.is_in_group("bodies"):
#			collision.collider.apply_central_impulse(-collision.normal * inertia)
	animate()

# Подбор предмета
func pick(item):
	var it = item.get_item()
	if it in inventory.keys():
		inventory[it] += item.get_amount()
	else:
		inventory[it] = item.get_amount()
	ui.update_inventory(inventory)

# Открытие инвенторя
func _unhandled_input(event):
	if event.is_action_pressed("inventory"):
		ui.toggle_inventory(inventory)

# Анимация
func animate():
	var anim = "stay"

	# Анимация бега
	if vel.x != 0:
		anim = "runL"
		if vel.x > 0:
			anim = "runR"
		else:
			$Body/Sprite.flip_h = false

	# Анимация падения
	if is_on_floor() == false and vel.x == 0:
		anim = "fall"

	# Убираю партиклы во время прыжка
	if is_on_floor() == false or anim == "stay":
		$Body/Particles2D.emitting = false

	# Запуск аниммации
	$Body/Anim.play(anim)

# Смерть	
func dead():
	is_dead = true
	#$Shape.disabled = true
	vel = Vector2(0, 0)
	$Camera2D.clear_current()
	$Body/Timer.start(1)

# Перезагрузка сценны по истечению таймера
func _on_Timer_timeout():
	get_tree().reload_current_scene()

# Падение из мира
func _on_Hitbox_area_entered(area):
	if area.is_in_group("fall"):
		dead()
