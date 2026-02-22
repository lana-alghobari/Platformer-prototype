extends CharacterBody2D

var health = 100
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var anim = get_node("AnimationPlayer")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if (health<=0):
		anim.play("Death");
		var tree = get_tree()
		await anim.animation_finished
		tree.change_scene_to_file("res://game_over.tscn")
		
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim.play("Jump")
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		if direction ==1 :
			get_node("AnimatedSprite2D").flip_h = false
		elif direction == -1:
			get_node("AnimatedSprite2D").flip_h = true
		velocity.x = direction * SPEED
		if velocity.y == 0 :
			anim.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y == 0 :
			anim.play("Idle")
	if velocity.y >0 :
		anim.play("Jump")
	move_and_slide()
