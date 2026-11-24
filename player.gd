
extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -500.0

const LEFTWALK_TEXTURE = preload("res://Untitled1_20261114122211.png")
const RIGHTWALK_TEXTURE = preload("res://Untitled1_20261114122715.png")
const BACK_TEXTURE = preload("res://Untitled1_20261114122951.png")
const IDLE_TEXTURE = preload("res://Untitled1_20261114122809.png")

var can_move : bool = true

@onready var sprite: Sprite2D = $Sprite2D

func _ready() -> void:
	Input.use_accumulated_input = false
	add_to_group("player")

func _physics_process(delta: float) -> void:	
	
	if not can_move:
		velocity = Vector2.ZERO
		# Ensure the player shows the idle texture during dialogue instead of freezing on a walk frame
		if sprite.texture != IDLE_TEXTURE:
			sprite.texture = IDLE_TEXTURE
			sprite.scale = Vector2(0.15, 0.15)
		return
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Declare direction (-1 for left, 1 for right, 0 for stopped).
	var direction := Input.get_axis("left", "right")

	# Swap the PNG texture based on movement direction.
	if direction < 0:
		if sprite.texture != LEFTWALK_TEXTURE:
			sprite.texture = LEFTWALK_TEXTURE
			sprite.scale = Vector2(0.15, 0.15) # Tweak this number for your left PNG
	elif direction > 0:
		if sprite.texture != RIGHTWALK_TEXTURE:
			sprite.texture = RIGHTWALK_TEXTURE
			sprite.scale = Vector2(0.15, 0.15) # Tweak this number for your right PNG
	else:
		if sprite.texture != IDLE_TEXTURE:
			sprite.texture = IDLE_TEXTURE
			sprite.scale = Vector2(0.15, 0.15)

	# Apply horizontal movement.
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_area_2d_body_entered(_body: Node2D) -> void:
	pass # Replace with function body.
