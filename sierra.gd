extends CharacterBody2D

const VELOCIDAD = 200
@export var gravedad : float = ProjectSettings.get_setting("physics/2d/default_gravity")

#AGREGAMOS LAS VARIABLES PARA MANEJAR LA POSICION DE LA SIERRA
const RAY_PISO_POSICION_X = 21
const RAY_PARED_TARGET_X = 20

func _ready():
	velocity.x = VELOCIDAD
	$RayCastDetecSuelo.position.x = RAY_PISO_POSICION_X
	$RayCastDetecPared.target_position.x= RAY_PARED_TARGET_X

func _physics_process(delta):
	# Agrego la gravedad al objeto
	
	if not is_on_floor():
		velocity.y = gravedad* delta
	
	if not $RayCastDetecSuelo.is_colliding() || $RayCastDetecPared.is_colliding():
		velocity.x *=-1
		$RayCastDetecSuelo.position.x *=-1
		$RayCastDetecPared.target_position.x *=-1 		
	
	move_and_slide()
