extends ScreenWrapper
class_name Bullet 
## TODO :[ Set this explictly in the next version later
## Currently Fixes the bullet crashes
var player: PlayerUI 

var speed: float = 300 # px/ sec.
var lifespan: float =  2.0 # seconds til end. 

func _process(delta: float) -> void:
	position.x += cos(rotation-PI/2) * delta * speed 
	position.y += sin(rotation-PI/2) * delta * speed 
	super._process(delta)
	#countdown
	lifespan -= delta
	if lifespan < 0.0: 
		queue_free()
