extends CharacterBody2D

@export var speed=300
@export var grav=30
@export var jump=600

@onready var ap=$AnimationPlayer
@onready var sprite=$Sprite2D


const att = preload("res://scenes/bulletscene.tscn")


func _physics_process(delta):
	if !is_on_floor():
		velocity.y += grav
		
		
	if Input.is_action_just_pressed("ui_up") && is_on_floor():
		velocity.y = -jump
	
	var horizontal=Input.get_axis("ui_left", "ui_right")
	
	velocity.x = speed * horizontal

	if horizontal !=0:
		switch_direction(horizontal)
		
	if Input.is_action_just_pressed("ui_attack"):

		attack()
		ap.play("attack")
		
	update(horizontal)	
	move_and_slide()
	

	

	
func update(horizontal):
	if is_on_floor():
		if horizontal == 0:
			ap.play("idle")
		else:
			ap.play("run")	
	else:
		if velocity.y !=0:
			ap.play("jump")
			

func switch_direction(horizontal):
	sprite.flip_h = (horizontal == -1)
	sprite.position.x=horizontal*4

func attack():
	var attack=att.instantiate() 
	var direction = 1
	if sprite.flip_h:
		direction = -1
		
	attack.velocity.x+=speed*direction
	get_parent().add_child(attack)
	attack.global_position=$Marker2D.global_position
	
