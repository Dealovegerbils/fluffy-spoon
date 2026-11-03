extends PanelContainer
class_name PauseMenu
@onready var play_button: Button = $VBoxContainer/PlayButton
@onready var quit_button: Button = $VBoxContainer/QuitButton
@onready var continue_button: Button = $VBoxContainer/ContinueButton
const BULLET = preload("res://Bullet/Bullet.tscn")


var main: Main = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_button.pressed.connect(on_play_pressed)
	quit_button.pressed.connect(on_quit_pressed)
	continue_button.pressed.connect(on_continue_pressed)
	
	main = get_parent()
	show()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused:
			show()
		else: 
			hide()
			
		get_tree().paused = not get_tree().paused 

func on_quit_pressed(): 
	get_tree().quit()
	
func on_continue_pressed():
	get_tree().paused = false
	hide()
func on_play_pressed(): 
	main.spawn_rocks(10) 
	hide()
	main.spawn_player()
