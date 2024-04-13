extends Node2D

@export var pipes_scene: PackedScene

@onready var spawn_upper = $SpawnUpper
@onready var spawn_lower = $SpawnLower
@onready var spawn_timer = $SpawnTimer


func _ready():
	spawn_pipes()
	
func _process(delta):
	pass
	
func spawn_pipes() -> void:
	var new_pipes = pipes_scene.instantiate()
	var y_pos = randf_range(
		spawn_upper.position.y,
		spawn_lower.position.y
	)
	new_pipes.position = Vector2(spawn_lower.position.x, y_pos)
	add_child(new_pipes)

# Stop all the pipes
func stop_pipes() -> void:
	spawn_timer.stop()
	var pipes = get_tree().get_nodes_in_group("pipes") # Get all the pipes in scene
	for pipe in pipes:
		pipe.set_process(false) # Stop the pipe from moving

func _on_spawn_timer_timeout():
	spawn_pipes()

func _on_plane_died():
	stop_pipes()
