extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (get_node("../../Player")!=null):
		text = "Acrons: " +str(get_node("../../Player").acronsNum)
	if get_node("../../Player")!=null and get_node("../../Player").acronsNum==0 and Input.is_action_pressed("ui_up") :
		text ="You have no acrons bitch"
	#if get_node("../../Bunny")!=null
		
