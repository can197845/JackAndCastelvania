extends Node2D



func _ready():
	pass 



func _process(delta):
	pass


func _on_area_activacion_body_entered(body):
	$AnimatedSprite2D.play("jumpTrampolin")
	body.velocity.y = -900
