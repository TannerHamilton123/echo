extends Camera2D
var min_pos
var max_pos

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.y = 410
	position.x = 600
	min_pos = 600 - 50
	max_pos = $"../walls/right".position.x - 1200/2.0 + 50
	print(position)

func _process(delta: float) -> void:
	position.x = $"../echo".position.x
	if position.x < min_pos:
		position.x = min_pos
	if position.x > max_pos:
		position.x = max_pos
	print(position)
