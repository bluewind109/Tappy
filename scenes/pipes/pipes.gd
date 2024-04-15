extends Node2D

@onready var score_sound = $ScoreSound

var _plane_died: bool = false

func _ready():
	SignalManager.on_plane_died.connect(on_plane_died)
	
func _process(delta):
	position.x -= GameManager.SCROLL_SPEED * delta

func on_plane_died() -> void:
	_plane_died = true
	set_process(false)

func _on_screen_exited():
	queue_free()

func _on_laser_body_exited(body):
	if _plane_died == true: return
	
	if body.is_in_group(GameManager.GROUP_PLAYER) == true:
		ScoreManager.increment_score()
		score_sound.play()

func _on_pipe_body_entered(body):
	print("_on_pipe_body_entered: ", body)
	#if body.is_in_group(GameManager.GROUP_PLAYER) == true:
	if body.has_method("die") == true:
		body.die()
