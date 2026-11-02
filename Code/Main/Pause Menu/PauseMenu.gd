extends PanelContainer

@onready var play_button: Button = $VBoxContainer/PlayButton
@onready var quit_button: Button = $VBoxContainer/QuitButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_button.pressed.connect(on_play_pressed)
	quit_button.pressed.connect(on_quit_pressed)
	show()

func _process(delta: float) -> void:
	if Input.is_action_pressed("pause"):
 	# FIXME: Not pausing, testing with quit().
		#get_tree().paused = true
		get_tree().quit()

func on_quit_pressed(): 
	print("quit")
	
func on_play_pressed():
	print("play")
