extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var coyote_timer: Timer = $CoyoteTimer

var coyote_frames = 6 
var coyote = false
var last_floor
var jumping = false

func _physics_process(delta: float) -> void:
	if GameManager.get_pause_status():
		return
	
	# Add the gravity. 
	if not is_on_floor():
		velocity += get_gravity() * delta
		jumping = false
	# 
	if Input.is_action_just_pressed("jump") and (is_on_floor() or coyote):
		velocity.y = JUMP_VELOCITY
		jumping = true
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	# flip sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	# play animation
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	# movement direction
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
		
	last_floor = is_on_floor()
	
	move_and_slide()
	
	if !is_on_floor() and last_floor and !jumping:
		coyote = true
		coyote_timer.start()

func _on_coyote_timer_timeout() -> void:
	coyote = false

func _on_ready() -> void:
	coyote_timer.wait_time = coyote_frames / 60
	position = GameManager.get_spawn()
