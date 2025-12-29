extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for child in get_parent().get_children():
		if child.is_in_group("food"):
			child.modulate.a -= 0.005
	pass
