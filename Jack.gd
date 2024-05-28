extends CharacterBody2D
signal golpe


@export var speed : float
@export var gravedad : float = ProjectSettings.get_setting("physics/2d/default_gravity")

var piso = 122
var health = GeneralValores.health




func _process(delta):
	movimiento_jugador()
	jump_jugador()
	gravedad_jugador(delta)
	verificar_piso()
func _physics_process(_delta):
	move_and_slide()


## Señales ###

func _on_area_detec_jack_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	health -=10
	if health == 0:
		print("Perdio")
	else: 
		print(health)

## Señales Propias ##

#Funciones propias
func verificar_piso():
	if not is_on_floor() and  position.y <= piso:
		print(position.y)
func jump_jugador():
	#con Input.is_action_just_pressed lo que hacemos es esperar 
	#que presionen el boton de salto y con la funcion is_on_floor 
	#preguntamos si el jugador se encuentra en el piso si estas dos 
	#condiciones se dan se procede al salto
	if Input.is_action_just_pressed("move_jump") and is_on_floor():
		velocity.y = -400 # salto en negativo para que se eleve positivo baja
func gravedad_jugador(delta):
	if not is_on_floor():
		velocity.y += gravedad * delta
func movimiento_jugador():
	# Se Carga en la variable los eje horizontales izquierda -1 y derecha 0
	var move_horizontal  = Input.get_axis("move_left","move_right")
	
	#Se fija si la variable es distinto de cero 
	if move_horizontal != 0:
		# Si la condicion se cumple lo multiplica por speed
		velocity.x = speed * move_horizontal
		$AnimatedSprite2D.flip_h = move_horizontal < 0
		$AnimatedSprite2D.play() 
		
			
	# si no es distinto de 0 es porque esta quieto	
	else:
		velocity.x = 0.0
	if move_horizontal == 0:
			$AnimatedSprite2D.stop() 
