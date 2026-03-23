extends CharacterBody2D
var isCollected = false
@onready var player = get_node("../Player")
@onready var anim = get_node("AnimatedSprite2D")
@onready var bunny = get_node("../Bunny")
@onready var foxy = get_node("../Foxy")

func _physics_process(delta: float) -> void:
	if isCollected == true:
		return
	if velocity.y == 0:
		anim.play("Idle")
	move_and_slide()
	
func _on_collectable_body_entered(body: Node2D) -> void:
	if body.has_method("acrons_num") or "acrons_num" in body :
		$CollisionShape2D.set_deferred("disabled" , true)
		$collectable/CollisionShape2D.set_deferred("disabled", true)
		isCollected = true
		body.acrons_num+=1 
		if(body.health<100):
			body.health+=10
		print(body.acrons_num)
		anim.play("Death")
		await anim.animation_finished
		queue_free()
