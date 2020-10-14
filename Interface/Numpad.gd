extends Popup

signal combination_correct

var combination = []
var guess = []

onready var display = $VBoxContainer/DisplayContainer/Display
onready var light = $VBoxContainer/ButtonContainer/GridContainer/StatusLight


func _ready():
	connect_buttons()
	reset_lock()

func connect_buttons():
	for child in $VBoxContainer/ButtonContainer/GridContainer.get_children():
		if child is Button:
			child.connect("pressed", self, "Button_pressed", [child.text])

func Button_pressed(button_text):
	if button_text == "OK":
		check_guess()
	else:
		enter(int(button_text))

func check_guess():
	if guess == combination:
		$AudioStreamPlayer.stream = load("res://SFX/threeTone1.ogg")
		$AudioStreamPlayer.play()
		light.texture = load("res://GFX/Interface/PNG/dotGreen.png")
		yield(get_tree().create_timer(1), "timeout")
		emit_signal("combination_correct")
		reset_lock()
	else:
		reset_lock()
	
func enter(button_text):
	$AudioStreamPlayer.stream = load("res://SFX/twoTone1.ogg")
	$AudioStreamPlayer.play()
	guess.append(button_text)
	update_display()
	
func update_display():
	display.text = PoolStringArray(guess).join("")
	if guess.size() == combination.size():
		check_guess()
	
func reset_lock():
	light.texture = load("res://GFX/Interface/PNG/dotRed.png")
	display.text = ""
	guess.clear()
	
 
