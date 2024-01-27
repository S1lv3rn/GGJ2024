extends Node2D


func _on_button_pressed():
	PlayerDetails.stage = 0
	PlayerDetails.kings_mood = 1
	get_tree().change_scene_to_file("res://main_game.tscn")
