extends CharacterBody2D

@export var speed : float
@export var gravedad : float = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var jump_velociad : float


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
func gravedad_jugador(delta):
	if not is_on_floor():
		velocity.y += gravedad * delta
	
func jump_jugador():
	if Input.is_action_just_pressed("move_jump") and is_on_floor():
		velocity.y = -jump_velociad
	pass	

func _process(delta):
	movimiento_jugador()
	jump_jugador()
	gravedad_jugador(delta)
	
	
	
func _physics_process(_delta):
	
	move_and_slide()
