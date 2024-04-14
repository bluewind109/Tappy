extends Node2D


func _ready():
	SignalManager.on_plane_died.connect(on_plane_died)
	
func _process(delta):
	position.x -= GameManager.SCROLL_SPEED * delta

func on_plane_died() -> void:
	set_process(false)

func _on_screen_exited():
	queue_free()

func _on_laser_body_exited(body):
	if body.is_in_group(GameManager.GROUP_PLAYER) == true:
		print("Point Scored")

func _on_pipe_body_entered(body):
	if body.is_in_group("player") == true:
		print("Plane Hit Pipe: ", body)
		if body.has_method("die") == true:
			body.die()
