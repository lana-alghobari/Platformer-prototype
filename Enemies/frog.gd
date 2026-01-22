extends CharacterBody2D
@onready var anim = get_node("AnimatedSprite2D")
func _on_player_detection_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		anim.play("Idle")
		print("Player")
