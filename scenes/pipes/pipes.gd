extends Node2D


func _ready():
	pass
	
func _process(delta):
	position.x -= 120.0 * delta

func _on_screen_exited():
	queue_free()

func _on_laser_body_exited(body):
	if body.is_in_group("player") == true:
		print("Point Scored")

func _on_pipe_body_entered(body):
	if body.is_in_group("player") == true:
		print("Plane Hit Pipe: ", body)
		if body.has_method("die") == true:
			body.die()
