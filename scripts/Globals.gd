extends Node

@export var level := 0
@export var coins := 0


func _input(event):
	if event.is_action_pressed("save_game"):
		print("saved")
		save_game()
		
		
func save():
	var save_dict = {
		"level": level, 
		"coins": coins
	}
	return save_dict
	

func save_game():
	var save_game = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var json_dict = JSON.stringify(save())
	
	save_game.store_line(json_dict)
	

	

