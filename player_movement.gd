extends CharacterBody3D

@export var speed: float = 6
@export var gravity: float = 30
@onready var dust_emitter = $dust_emitter

func _physics_process(delta):
	var velocity_floor = speed * Input.get_vector(
		"move_left", "move_right", "move_up", "move_down"
	)
	velocity = Vector3(velocity_floor.x, velocity.y - gravity * delta, velocity_floor.y)
	move_and_slide()

	dust_emitter.emitting = is_on_floor() && velocity_floor.length() > 0.1
