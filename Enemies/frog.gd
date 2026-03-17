extends CharacterBody2D

@onready var anim = get_node("AnimatedSprite2D")
@onready var player = get_node("../Player") 
@onready var acron = get_node("../Acron/shootableAcron")
@onready var bunny = get_node("../Bunny")

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
	if chase and player!=null:
		var direction = (player.position - position).normalized()
		anim.flip_h = direction.x > 0 
		velocity.x = speed * direction.x
		if is_on_floor(): 
			anim.play("Jump") 
			velocity.y = jump_velocity
	if chase and bunny!=null:
		var direction = (bunny.position - position).normalized()
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
	if body.name == "Player" or body.name == "Bunny":
		chase = true

func _on_player_detection_body_exited(body: Node2D) -> void:
	if body.name == "Player" or body.name == "Bunny":
		chase = false


func _on_character_death_body_entered(body: Node2D) -> void:
	if body.name == "Player" or body.name == "Bunny":
		dead = true
		print("froggy dead")
		$CollisionShape2D.set_deferred("disabled" ,true)
		anim.play("Death")
		await anim.animation_finished 
		self.queue_free()


func _on_damage_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.take_damage()
	if body.name == "Bunny":
		body.health-=10


func _on_acron_danage_body_entered(body: Node2D) -> void:
		if body.name == "shootableAcron":
			dead = true 
			anim.play("Death")
			await anim.animation_finished
			print("froggy dead")
			queue_free()
			
