extends Control



func _on_StartButton_pressed():
	get_tree().change_scene("res://Levels/Level1.tscn")


func _on_QuitGame_pressed():
	get_tree().quit()
