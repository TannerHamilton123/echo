extends CharacterBody2D


const SPEED = 300.0

@onready var up_lift :float = -980 *0.5 / 2
@onready var screech_scene = preload("res://screech.tscn")
var max_energy = 100
var energy

func _ready():
	energy = max_energy
	pass

func _physics_process(delta: float) -> void:
	Global.energy = energy
	velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED/100)
	
	if Input.is_action_pressed("ui_up"):
		$flap_timer.wait_time = 0.25
	if Input.is_action_pressed("ui_down"):
		$flap_timer.wait_time = 0.75
	if not Input.is_action_pressed("ui_down") and not Input.is_action_pressed("ui_up"):
		$flap_timer.wait_time = 0.5
	if Input.is_action_just_pressed("ui_accept"):
		screech()
		

	move_and_slide()

func flap():
	velocity.y= up_lift
	energy -= 1
	
func _on_flap_timer_timeout() -> void:
	flap()
	pass # Replace with function body.

func screech():
	energy -= 5
	var screech_instance = screech_scene.instantiate()
	screech_instance.position = self.position
	get_parent().add_child(screech_instance)




func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("food"):
		energy = min(energy + body.energy,max_energy)
		body.queue_free()
	pass # Replace with function body.
