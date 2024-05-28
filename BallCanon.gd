extends Area2D



func _process(delta):
	position.x -=1
	if $RayCastColision.is_colliding():
		print("colision")
		
func _on_body_entered(body):
	queue_free()
	
