extends PanelContainer
class_name PauseMenu
@onready var play_button: Button = $VBoxContainer/PlayButton
@onready var play_again_button: Button = $VBoxContainer/PlayAgainButton
@onready var quit_button: Button = $VBoxContainer/QuitButton
@onready var continue_button: Button = $VBoxContainer/ContinueButton
const BULLET = preload("res://Bullet/Bullet.tscn")


var main: Main = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_button.pressed.connect(on_play_pressed)
	quit_button.pressed.connect(on_quit_pressed)
	continue_button.pressed.connect(on_continue_pressed)
	play_again_button.pressed.connect(on_play_again_pressed)
	main = get_parent()
	play_button.show()
	play_again_button.hide()
	continue_button.hide()
	quit_button.show()
	show()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = not get_tree().paused 
		if get_tree().paused:
			play_button.hide()
			play_again_button.hide()
			continue_button.show()
			quit_button.show()
			show()
		else: 
			hide()
			


func on_quit_pressed(): 
	get_tree().quit()
	
func on_continue_pressed():
	get_tree().paused = false
	hide()
func on_play_pressed(): 
	main.spawn_rocks(10) 
	hide()
	main.spawn_player()

func on_play_again_pressed(): 
	get_tree().reload_current_scene()
