extends Area2D

@onready var timer = $Timer

func _on_body_entered(body): 
	if body is CharacterBody2D:  # Verificamos si el cuerpo es el jugador
		print("You're Fried!")
		Engine.time_scale = 0.8
		
		# Llamamos a la función de muerte del jugador
		body.die()
		timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()

	
	
	
