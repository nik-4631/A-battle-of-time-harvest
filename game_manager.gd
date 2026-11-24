extends Node

var items_collected: int = 0
@export var target_amount: int = 7
var target_reached: bool = false

func add_item() -> void:
	if target_reached:
		return 
		
	items_collected += 1
	print("Items collected: ", items_collected, "/", target_amount)
	
	if items_collected >= target_amount and not target_reached:
		target_reached = true
		print("All paper shreds collected! Portal is now unlocked.")
