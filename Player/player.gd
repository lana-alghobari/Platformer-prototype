extends CharacterBody2D
var health = 100
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var acronsNum = 0
@export var acron_scene :PackedScene

@onready var animation = get_node("AnimationPlayer")
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if (health<=0):
		animation.play("Death");
		var tree = get_tree()
		await animation.animation_finished
		tree.change_scene_to_file("res://game_over.tscn")
		
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animation.play("Jump")
		
	var direction := Input.get_axis("ui_left", "ui_right")
	if Input.is_action_just_pressed("ui_up"):
		if acronsNum> 0:
			animation.play("Shoot")
			acronsNum-=1
			var acron = acron_scene.instantiate()
			get_parent().add_child(acron)
			var dir =1 
			if $AnimatedSprite2D.flip_h ==true:
				dir = -1
			acron.dir = dir
			acron.global_position = global_position +Vector2(20*dir,0)
			await animation.animation_finished
	
	if Input.is_action_just_pressed("ui_down"):
		if acronsNum>0:
			acronsNum-=1
			health+=10 
	if direction:
		if direction ==1 :
			get_node("AnimatedSprite2D").flip_h = false
		elif direction == -1:
			get_node("AnimatedSprite2D").flip_h = true
		velocity.x = direction * SPEED
		if velocity.y == 0 :
			animation.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y == 0 :
			animation.play("Idle")
	if velocity.y >0 :
		animation.play("Jump")
	move_and_slide()

func take_damage():
	if health > 0:
		health -= 10
		animation.play("Hurt")
		await animation.animation_finished
