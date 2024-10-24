extends Node2D

const SPEED = 60

var direction = 1

@onready var ray_cast_derrecha = $"../RayCastderrecha"
@onready var ray_cast_izq = $"../RayCastizq"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_derrecha.is_colliding():
		direction = -1
		if ray_cast_izq.is_colliding():
			direction = 1

	
	position.x += direction * SPEED * delta
