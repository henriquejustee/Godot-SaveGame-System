extends Control

@onready var coins_counter = %Coins_Counter as Label
@onready var level_counter = %Level_Counter as Label


# Called when the node enters the scene tree for the first time.
func _ready():
	coins_counter.text = str(Globals.coins)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	coins_counter.text = str(Globals.coins)
	level_counter.text = str(Globals.level)
