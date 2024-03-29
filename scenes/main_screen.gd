class_name MainMenu
extends Control

@onready var new_game_button = $VBoxContainer/NewGameButton
@onready var exit_game_button = $VBoxContainer/QuitGameButton
@onready var load_game_button = $VBoxContainer/LoadGameButton


func _ready():
	exit_game_button.button_down.connect(on_exit_pressed)
	load_game_button.button_down.connect(load_game_pressed)
	new_game_button.button_down.connect(new_game_pressed)
	

func new_game_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	
func load_game_pressed() -> void:
	if not FileAccess.file_exists("user://savegame.save"):
		return
	
	var save_game = FileAccess.open("user://savegame.save", FileAccess.READ)
	
	while save_game.get_position() < save_game.get_length():
		var json_dict = save_game.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_dict)
		var node_data = json.get_data()
		
		Globals.level += node_data.level
		Globals.coins += node_data.coins
	
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	
func on_exit_pressed() -> void:
	get_tree().quit()

