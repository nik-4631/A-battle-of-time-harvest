extends Area2D

var player = null
var warning_printed = false # Prevents spamming the console every frame

func _ready():
	player = get_node("../player")

func _process(delta: float) -> void:
	if player.global_position.x >= 2000:
		# Check if all paper shreds have been collected
		if GameManager.target_reached:
			print("Player reached 2000px with all shards! Switching to present...")
			get_tree().change_scene_to_file("res://good present.tscn")
		else:
			# Only print the warning once until the player backs away
			if not warning_printed:
				print("Portal is locked! Collect all paper shreds first.")
				warning_printed = true
	else:
		# Reset the warning when the player walks back to the left
		warning_printed = false
