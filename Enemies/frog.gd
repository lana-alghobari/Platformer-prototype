extends CharacterBody2D

@onready var anim = get_node("AnimatedSprite2D")
@onready var player = get_node("../Player")

var speed = 100
var jump_velocity = -250
var chase = false
var dead = false

func _physics_process(delta: float) -> void:
	if dead :
		velocity.x =0
		velocity.y = 0
		return
	if not is_on_floor():
		velocity += get_gravity() * delta
	if chase:
		var direction = (player.position - position).normalized()
		anim.flip_h = direction.x > 0 
		velocity.x = speed * direction.x
		if is_on_floor(): 
			anim.play("Jump") 
			velocity.y = jump_velocity
		
	else:
		anim.play("Idle")
		velocity.x = 0

	move_and_slide()

func _on_player_detection_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		chase = true

func _on_player_detection_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		chase = false


func _on_character_death_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		dead = true
		print("froggy dead")
		anim.play("Death")
		await anim.animation_finished 
		self.queue_free()
	if body.name == "Acron":
		dead = true 
		anim.play("Death")
		body.pop() 
		await anim.animation_finished


func _on_damage_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.take_damage()
