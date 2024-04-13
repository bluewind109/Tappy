extends CharacterBody2D

signal on_plane_died

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer

const GRAVITY: float = 1500.0
const POWER: float = -500.0

func _ready():
	pass
	
func _physics_process(delta):
	fly(delta)
	move_and_slide()
	if is_on_floor() == true:
		die()
	
func fly(delta: float) -> void:
	velocity.y += GRAVITY * delta
	
	if Input.is_action_just_pressed("fly") == true:
		velocity.y = POWER
		animation_player.play("power")
	
func die() -> void:
	set_physics_process(false)
	animated_sprite_2d.stop()
	on_plane_died.emit()
