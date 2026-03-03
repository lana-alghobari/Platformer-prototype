extends CharacterBody2D
var speed = 50
@onready var player = get_node("../Player")
@onready var anim = get_node("AnimatedSprite2D")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.player_shot.connect(on_player_shot)

func _physics_process(delta: float) -> void:
	move_and_slide()
	
func on_player_shot(direction):
	shoot(direction)
	
func shoot (direction):
	velocity.x = speed*direction
	anim.play("Shot")
	await anim.animation_finished
	
func pop():
	anim.play("Collision")
	await anim.animation_finished
