extends Area2D

func _ready() -> void:
	# Connect the signal when the player enters the area
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	# Check if the object that touched it is in the "player" group
	if body.is_in_group("player"):
		GameManager.add_item() # Tell the global manager to count it
		queue_free()           # Delete the item node from the game world
