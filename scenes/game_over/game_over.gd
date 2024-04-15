extends Control

@onready var label_game_over = $LabelGameOver
@onready var label_space = $LabelSpace
@onready var timer = $Timer
@onready var game_over_sound = $GameOverSound

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	SignalManager.on_plane_died.connect(on_plane_died)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if label_space.visible == true:
		if Input.is_action_just_pressed("fly") == true:
			GameManager.load_main_scene()
	
func on_plane_died() -> void:
	show()
	timer.start()
	game_over_sound.play()

func _on_timer_timeout():
	label_game_over.hide()
	label_space.show()
