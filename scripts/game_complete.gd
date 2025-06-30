extends Control

@onready var restart_button = $VBoxContainer/RestartButton
@onready var quit_button = $VBoxContainer/QuitButton

func _ready():
	restart_button.pressed.connect(_on_restart_pressed)
	quit_button.pressed.connect(_on_quit_pressed)

func _on_restart_pressed():
	# Reset to main game
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_quit_pressed():
	# Quit the game
	get_tree().quit() 
