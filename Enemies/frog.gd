extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@onready var player = get_node("../Player")

var speed = 100
var jump_velocity = -150
var chase = false
var has_jumped = false

func _physics_process(delta: float) -> void:
	# ALWAYS apply gravity
	velocity += get_gravity() * delta

	if chase:
		var direction = (player.position - position).normalized()

		anim.flip_h = direction.x > 0
		velocity.x = speed * direction.x

		if is_on_floor() and not has_jumped:
			velocity.y = jump_velocity
			has_jumped = true
			anim.play("Jump")
	else:
		velocity.x = 0
		anim.play("Idle")

	if is_on_floor():
		has_jumped = false

	move_and_slide()

func _on_player_detection_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		chase = true

func _on_player_detection_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		chase = false
