extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var death_timer: Timer = $death_timer  # Asegúrate de que el nombre sea correcto

var is_dead = false  # Variable para saber si el jugador está muerto

func _physics_process(delta):
	# Si el jugador está muerto, no procesamos física ni controles
	if is_dead:
		return
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("move_left", "move_right")
	
	# Flip the sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	# Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else: 
		animated_sprite.play("jump")

	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

# Nueva función para la muerte del jugador
func die():
	is_dead = true
	animated_sprite.play("death")  # Reproducimos la animación de muert

# Conectar la señal de tiempo de espera del temporizador
func _on_death_timer_timeout() -> void:
	get_tree().reload_current_scene()  # Reinicia la escena cuando el temporizador se acaba
