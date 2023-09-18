extends Control

func _ready():
	$VBoxContainer/StartGameButton.grab_focus()

func _on_start_game_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/World1.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
