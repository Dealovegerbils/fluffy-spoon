extends Node
class_name Main

const ROCK = preload("res://Rock/Rock.tscn")
const UfO = preload("res://UFO/UFO.tscn")
const PLAYER_UI = preload("res://PlayerUI/PlayerUI.tscn")
@onready var pause_menu: PauseMenu = $PauseMenu


@onready var ufo_timer: Timer = $UfoTimer


var players: Array[PlayerUI]

var rock_count: int = 3  

func start_new_round(): 
	pass

func just_score(delta_score,player):
	players[0].update_score(delta_score)
	
func spawn_player():
	var player = PLAYER_UI.instantiate()
	player.main = self
	add_child(player)
	players.append(player)
	
func _ready() -> void:
	ufo_timer.timeout.connect(on_ufo_spawned)
	#spawn_rocks(6) dont spawn the rocks immediatley
	#spawn_player()

	
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
	
