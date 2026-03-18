extends Node2D

func _on_ladder_1_body_entered(body: Node2D) -> void:
	if body.name == "Foxy":
		body.isClimbing = true

func _on_ladder_1_body_exited(body: Node2D) -> void:
	if body.name == "Foxy":
		body.isClimbing = false


func _on_ladder_2_body_entered(body: Node2D) -> void:
	if body.name == "Foxy":
		body.isClimbing = true

func _on_ladder_2_body_exited(body: Node2D) -> void:
	if body.name == "Foxy":
		body.isClimbing =false
