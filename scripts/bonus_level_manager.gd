extends Node

@onready var finish_flag = $"../FinishFlag"
@onready var game_manager = $"../Game Manager"

var total_coins = 4
var flag_shown = false

func _ready():
	# Check for flag visibility every frame since coins update the game manager directly
	pass

func _process(_delta):
	# Check if all coins collected and flag not yet shown
	if not flag_shown and game_manager.score >= total_coins:
		show_finish_flag()

func show_finish_flag():
	flag_shown = true
	finish_flag.visible = true
	finish_flag.body_entered.connect(_on_finish_flag_entered)
	print("Finish flag is now visible!")

func _on_finish_flag_entered(body):
	if body.name == "player":
		print("Player reached finish flag!")
		# Change to game completion screen
		get_tree().change_scene_to_file("res://scenes/game_complete.tscn") 
