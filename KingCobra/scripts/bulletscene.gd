extends CharacterBody2D

@onready var ap=$AnimationPlayer
@onready var sprite=$Sprite2D
var speed= 550

func _physics_process(delta):
	ap.play("strike")
	var collision_info=move_and_collide(velocity.normalized()* delta * speed)
	if velocity.x<0:
		$venom.flip_h=true
		
	



