extends Area2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D



func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemigo"):
		area.get_parent().queue_free()
		queue_free()
