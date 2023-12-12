extends CharacterBody2D


var speed = 150.0

@onready var ap = $AnimationPlayer
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")



func _physics_process(delta):
	velocity.x = speed
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()
	if is_on_floor():
		if velocity.x == 0:
			ap.play("idle")
		else:
			ap.play("run")	
			
	if is_on_wall():
			speed=-speed
			
	if velocity.x<0:
		$Sprite2D.flip_h=true
	else:
		$Sprite2D.flip_h=false		
			

