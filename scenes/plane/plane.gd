extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

const GRAVITY: float = 1500.0
const POWER: float = -500.0

func _ready():
	pass
	
func _physics_process(delta):
	fly(delta)
	move_and_slide()
	if is_on_floor() == true:
		die()
		
	pass
	
func fly(delta: float) -> void:
	velocity.y += GRAVITY * delta
	
	if Input.is_action_just_pressed("fly") == true:
		velocity.y = POWER
		
	pass
	
func die() -> void:
	set_physics_process(false)
	animated_sprite_2d.stop()
	
	pass
