extends Node

# variable of score
var score = 0
@onready var score_label = $"Score Label"

# Script counting scores
func add_point():
	score += 1
	score_label.text = "You Collected " + str(score) + " coins."
	print("Score: ", score)  # Debug print
	if score == 16:
		print("Attempting to change to bonus level...")  # Debug print
		get_tree().change_scene_to_file("res://scenes/bonus_level.tscn")
	
	
	
