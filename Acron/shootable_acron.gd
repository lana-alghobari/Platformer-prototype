extends CharacterBody2D
var speed = 150
@onready var anim = get_node("AnimationPlayer")
@onready var player = get_node("../Player")
var dir =1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.player_shot.connect(on_player_shot)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if dir == 0 :
		return
	velocity.x = speed*dir
	if velocity.y ==0:
		anim.play("shot")
	move_and_slide()
	
	
func on_player_shot(direction ,pos): 
	shoot(direction,pos)
	
func shoot (direction ,pos):
	#dir = direction
	velocity.x = speed*direction
	if direction==-1 :
		$AnimatedSprite2D.flip_h = true	
	#global_position = pos
	anim.play("Shot")
	await anim.animation_finished
