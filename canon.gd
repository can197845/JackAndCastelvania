extends Node2D

#Habilita al inpector para cargar la esena de la bola
@export var bola : PackedScene

func _ready():
	pass
func _process(delta):

	pass
func disparo():
	#Aca cargamos la ecena de la bola en la variable creada
	var bolaCanon = bola.instantiate()
	bolaCanon.global_position = $MarkerBola.global_position
		#añadimos al padre el hijo de la ecena de la bola
	get_parent().add_child(bolaCanon)
	pass

func _on_timer_timeout():
	#Cada ves que el tiempo pase se ejecuta la funcion
	#de disparo con esto controlamos la aparicion de la bola
	#disparo()
	pass
	pass

func _on_body_entered(body):
	disparo()
	pass # Replace with function body.
