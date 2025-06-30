extends Area2D

# Defining the Game Manager and Animation Player
@onready var game_manager = %"Game Manager"
@onready var animation_player = $AnimationPlayer

# Callback of game manager adding the coins
func _on_body_entered(body):
	game_manager.add_point()
	animation_player.play("pickup") # calls the keyframes back
