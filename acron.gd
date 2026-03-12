extends CharacterBody2D
var isCollected = false
@onready var player = get_node("../Player")
@onready var anim = get_node("AnimatedSprite2D")

func _physics_process(delta: float) -> void:
	if isCollected == true:
		return
	if velocity.y == 0:
		anim.play("Idle")
	move_and_slide()
	
func _on_collectable_body_entered(body: Node2D) -> void:
	if body.name == "Player" and isCollected == false:
		$CollisionShape2D.set_deferred("disabled" , true)
		isCollected = true
		player.acronsNum+=1 
		if(player.health<100):
			player.health+=10
		print(player.acronsNum)
		anim.play("Death")
		await anim.animation_finished
		queue_free()
