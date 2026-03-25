extends CharacterBody2D
var health = 100
var speed = 450
var JUMP_VELOCITY = -500
var acrons_num = 0
var isTransformed = false
@onready var anim = get_node("AnimationPlayer")
#@onready var player_scene = preload("res://Player/player.tscn")
#@onready var foxy_scene = preload("res://Player/foxy.tscn")
#@onready var bunny_scene = preload("res://Player/bunny.tscn")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim.play("Jump")
	if Input.is_action_just_pressed("ui_end") and !isTransformed:
		print(player_scene)
		changeSqueeky()
		move_and_slide()
	if Input.is_action_just_pressed("ui_home") and !isTransformed:
		changeFoxy()
		move_and_slide()
		
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		if direction ==1 :
			get_node("AnimatedSprite2D").flip_h = false
		elif direction == -1:
			get_node("AnimatedSprite2D").flip_h = true
		velocity.x = direction * speed
		if velocity.y == 0 :
			anim.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		if velocity.y == 0 :
			anim.play("Idle")
	move_and_slide()
	
#func changeSqueeky():
	#if isTransformed :
		#return
	#isTransformed = true 
	#var player = player_scene.instantiate()
	#get_parent().add_child(player)
	#var pos = global_position 
	#player.global_position = pos
	#player.acrons_num = acrons_num
	#player.health = health
	#if has_node("CameraFollowTarget"):
		#player.add_child(get_node("CameraFollowTarget"))
	#set_physics_process(false)
	#set_process(false)
	#collision_layer = 0  # Remove from collision
	#collision_mask = 0   # Stop detecting collisions
	#visible = false
	
#func changeFoxy() :
	#if isTransformed :
		#return
	#isTransformed = true 
	#var foxy = foxy_scene.instantiate()
	#get_parent().add_child(foxy)
	#var pos = global_position
	#foxy.global_position = pos
	#foxy.acrons_num = acrons_num
	#foxy.health= health
	#if has_node("CameraFollowTarget"):
		#foxy.add_child(get_node("CameraFollowTarget"))
	#set_physics_process(false)
	#set_process(false)
	#collision_layer = 0  # Remove from collision
	#collision_mask = 0   # Stop detecting collisions
	#visible = false
