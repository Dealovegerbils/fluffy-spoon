extends Node
class_name Main

const ROCK = preload("res://Rock/Rock.tscn")
const UfO = preload("res://UFO/UFO.tscn")
const PLAYER_UI = preload("res://Player UI/PlayerUI.tscn")
const UFO = preload("res://UFO/UFO.tscn")


@onready var ufo_timer: Timer = $UfoTimer

var players: Array[PlayerUI]

func just_score(delta_score,player):
	players[0].update_score(delta_score)
	
func spawn_player():
	var player =PLAYER_UI.instantiate()
	add_child(player)
	players.append(player)
	
func _ready() -> void:
	ufo_timer.timeout.connect(on_ufo_spawned)
	spawn_rocks(6)
	spawn_player()

func _process(delta: float) -> void:
	if Input.is_action_pressed("pause"):
 	# FIXME: Not pausing, testing with quit().
		#get_tree().paused = true
		get_tree().quit()

func spawn_ship():
	var ship = SHIP.instantiate()
	ship.player = self
	
## Spawn a number of Rocks from the corners 
func spawn_rocks(rock_count):
	for r in rock_count:
		var rock= ROCK.instantiate()
		rock.main = self
		add_child(rock)
	

##Callback for UFO timer.
func on_ufo_spawned():
	var ufo: UFO = UfO.instantiate()
	if randi() % 2:
		ufo.position.x = 0
	else:
		ufo.position.x = get_viewport().size.x
	
	ufo.position.y = randf_range(0, get_viewport().size.y)
	add_child(ufo)
