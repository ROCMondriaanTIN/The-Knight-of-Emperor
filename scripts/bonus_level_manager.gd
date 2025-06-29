extends Node

@onready var finish_flag = $"../FinishFlag"
@onready var game_manager = $"../Game Manager"

var total_coins = 4
var collected_coins = 0

func _ready():
	# Connect to coin collection events
	var coins = get_tree().get_nodes_in_group("coins")
	for coin in coins:
		if coin.has_signal("body_entered"):
			coin.body_entered.connect(_on_coin_collected)

func _on_coin_collected(body):
	if body.name == "player":
		collected_coins += 1
		
		# Show finish flag when all coins collected
		if collected_coins >= total_coins:
			finish_flag.visible = true
			finish_flag.body_entered.connect(_on_finish_flag_entered)

func _on_finish_flag_entered(body):
	if body.name == "player":
		# Change to game completion screen
		get_tree().change_scene_to_file("res://scenes/game_complete.tscn") 