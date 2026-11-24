extends Area2D

var player = null

func _ready():
	player = get_node("../player")

func _process(delta: float) -> void:
	if player.global_position.x >= 2000:
		print("Player reached 2000px! Switching to present...")
		get_tree().change_scene_to_file("res://past.tscn")
