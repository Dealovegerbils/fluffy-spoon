extends Area2D
class_name Rock 
var speed: float= 100  # px/ sec
var direction: Vector2 = Vector2(-1,1)
var velocity: Vector2 = Vector2.ZERO
#var velocity: Vector2 = Vector2.ZERO

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity = direction * speed * delta
	position += velocity
	
	if position.x < 0:
		position.x= get_viewport().size.x
	if position.y < 0: 
		position.y = get_viewport().size.y
	if position.x > get_viewport().size.x:
		position.x = 0
	if position.y > get_viewport().size.y: 
		position.y = 0
		
