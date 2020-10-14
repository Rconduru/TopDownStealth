extends Node2D

func _ready():
	var music = load("res://Music/BackgroundMusic.tscn").instance()
	add_child(music)
