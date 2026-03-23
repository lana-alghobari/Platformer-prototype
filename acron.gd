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
	#if body.name == "Player" and isCollected == false:
		#$CollisionShape2D.set_deferred("disabled" , true)
		#$collectable/CollisionShape2D.set_deferred("disabled", true)
		#isCollected = true
		#player.acrons_num+=1 
		#if(player.health<100):
			#player.health+=10
		#print(player.acrons_num)
		#anim.play("Death")
		#await anim.animation_finished
		#queue_free()
	#if body.name == "shootableAcron" :
		#$CollisionShape2D.set_deferred("disabled" , true)
	#if body.name =="Bunny":
		#$CollisionShape2D.set_deferred("disabled" , true)
		#$collectable/CollisionShape2D.set_deferred("disabled", true)
		#isCollected = true
		#bunny.acrons_num+=1
		#if (bunny.health<100):
			#bunny.health+=10
		#anim.play("Death")
		#await anim.animation_finished
		#queue_free()
	#if body.name == "Foxy":
		#$CollisionShape2D.set_deferred("disabled" , true)
		#$collectable/CollisionShape2D.set_deferred("disabled", true)
		#isCollected = true
		#foxy.acrons_num+=1
		#if (foxy.health<100):
			#foxy.health+=10
		#anim.play("Death")
		#await anim.animation_finished
		#queue_free()
