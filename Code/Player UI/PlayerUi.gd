extends PanelContainer
class_name PlayerUI

const LIFE = preload("res://Player UI/assets/life.tscn")

@onready var score_ui: Label = $VBox/ScoreUI
@onready var lives_ui: HBoxContainer = $VBox/LivesUI

var score: int = 0
var lives: int = 3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_score(1)
	update_lives(3) # 6

func update_score(delta_score):
	score += delta_score
	score_ui.text=str(score)

func update_lives(delta_lives):
	lives =+ delta_lives # 6
	clear_lives()
	build_lives()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func clear_lives():
	for child in lives_ui.get_children():
		child.queue_free()

func build_lives(): 
	for l in lives: 
		var life = LIFE.instantiate()
		lives_ui.add_child(life)
