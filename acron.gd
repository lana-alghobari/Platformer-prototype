extends CharacterBody2D
var speed = 150
var isCollected = false
@onready var pos = self.get_position_delta() 
@onready var player = get_node("../Player")
@onready var anim = get_node("AnimatedSprite2D")

#func _ready() -> void:
	#player.player_shot.connect(on_player_shot)

func _physics_process(delta: float) -> void:
	if isCollected == true:
		anim.play("Death")
		await anim.animation_finished
		self.queue_free()
	if velocity.y == 0:
		anim.play("Idle")
	move_and_slide()
	
#func on_player_shot(direction ,pos): 
	#shoot(direction, player.pos)
	
#func shoot (direction ,pos):
	#velocity.x = speed*direction
	#self.pos = pos
	#anim.play("Shot")
	#await anim.animation_finished
	
func _on_collectable_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		isCollected = true
		player.acronsNum+=1 
		print(player.acronsNum)
