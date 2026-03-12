extends CharacterBody2D
var speed = 150
@onready var anim = get_node("AnimationPlayer")
@onready var player = get_node("../Player")
var dir =1
var isPopped = false

func _ready() -> void:
	await get_tree().create_timer(3).timeout
	isPopped = true
	anim.play("pop")
	await anim.animation_finished
	queue_free()

func _physics_process(delta: float) -> void:
	velocity.x = speed*dir
	if isPopped == true :
		return
	if dir ==-1 :
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
	if velocity.y ==0 :
		anim.play("shot")
	move_and_slide()
	
