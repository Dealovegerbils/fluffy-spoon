extends ScreenWrapper
class_name Rock

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
const ROCK = preload("uid://d01ut7s70ugxv")

var main: Main

var speed: float = 100 # px / sec
var direction: Vector2 = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO

func _ready() -> void:
	area_entered.connect(on_area_entered)
	direction = Vector2(randf_range(-1.0, 1.0), randf_range(-1.0, 1.0))
	animated_sprite_2d.frame = randi_range(0, 2)
	animated_sprite_2d.sprite_frames.get_frame_count("default")

func _process(delta: float) -> void:
	velocity = direction * speed * delta
	position += velocity
	super._process(delta)

## Collision function.
func on_area_entered(other_area: Area2D):
	if other_area is Bullet:
		if other_area.player != null:
			main.just_score(1, other_area.player)
		other_area.queue_free()
		queue_free()
	
	if other_area is Ship:
		other_area.destroy()
		queue_free()
		
func split():
	if scale.x > 0.25:
	# Spawn 2 new rocks. 
	# Delete current rock. 
		for i in 2: 
			var rock = ROCK.instantiate()
			rock.position =position
			rock.scale = scale * 0.5
			get_parent().add_child.called_deferred(rock)
	queue_free()
