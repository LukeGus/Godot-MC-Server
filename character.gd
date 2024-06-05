extends CharacterBody2D

var force_strength = 250
var jump_strength = 325

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	
	# Add gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_strength
	
	# Get input direction and add that to the movement
	var direction = Input.get_axis("left", "right")
	
	if direction:
		velocity.x = direction * force_strength
	else:
		velocity.x = move_toward(velocity.x, 0, force_strength)
	
	move_and_slide()
