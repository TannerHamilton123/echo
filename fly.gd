extends CharacterBody2D


const SPEED = Vector2(100.0,0)
const JUMP_VELOCITY = -400.0
var direction : float = 0
var energy = 20
func _physics_process(delta: float) -> void:
	velocity = SPEED.rotated(direction)
	move_and_slide()


func _on_change_direction_timeout() -> void:
	direction = randf_range(0,2*PI)
	pass # Replace with function body.
 
