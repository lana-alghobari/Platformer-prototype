extends CharacterBody2D
var health = 100
var speed = 450
var jumpVelocity = -700
@onready var anim = get_node("AnimationPlayer")

func _physics_process(delta: float) -> void:
	if velocity.y==0:
		anim.play("Idle")
