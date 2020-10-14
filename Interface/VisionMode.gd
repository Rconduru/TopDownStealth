extends CanvasModulate

const DARK = Color("111111")
const NIGHTVISION = Color("37bf62")

var cooldown = false

func _ready():
	visible = true
	color = DARK

func cycle_vision_mode():
	if color == NIGHTVISION:
		DARK_mode()
	else:
		NIGHTVISION_mode()

func DARK_mode():
	if not cooldown:
		color = DARK
		get_tree().call_group("lights", "show")
		get_tree().call_group("labels", "hide")
		$AudioStreamPlayer2D.stream = load("res://SFX/nightvision_off.wav")
		$AudioStreamPlayer2D.play()
		cooldown = true
		yield(get_tree().create_timer(1), "timeout")
		cooldown = false
func NIGHTVISION_mode():
	if not cooldown:
		color = NIGHTVISION
		get_tree().call_group("lights", "hide")
		get_tree().call_group("labels", "show")
		$AudioStreamPlayer2D.stream = load("res://SFX/nightvision.wav")
		$AudioStreamPlayer2D.play()
		cooldown = true
		yield(get_tree().create_timer(1), "timeout")
		cooldown = false
