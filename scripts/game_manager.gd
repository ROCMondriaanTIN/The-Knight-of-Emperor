extends Node

var score = 0
@onready var score_label = $"Score Label"

# Script counting scores
func add_point():
	score += 1
	score_label.text = "You Collected " + str(score) + " coins."
	
	
	
