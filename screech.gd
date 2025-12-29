extends Node2D
var time = 0
var screech_radius = 0.0
var width = 0.0
var max_radius :float = 500
var area_radius : float
var screech_time = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	
	pass # Replace with function body.

func _draw():
	
	draw_arc(Vector2(0,0),screech_radius,-PI,PI,100,Color.GRAY,time*width)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta
	area_radius = screech_radius + width
	
	if screech_radius > max_radius:
		area_radius = 1

		queue_free()
		pass
	
	screech_radius = lerp(0.0,max_radius,time/screech_time)
	width = lerp(0.0,50.0,time/screech_time)
	self_modulate.a =lerp(1.0,0.0,time/screech_time)
	
	$Area2D/CollisionShape2D.shape.radius = area_radius
	
	queue_redraw()



func _on_area_2d_body_entered(body: Node2D) -> void:
	var transparency = lerp(0.0,1.0, area_radius / max_radius)
	body.modulate.a = transparency
	print(body.name)
	pass # Replace with function body.
	
