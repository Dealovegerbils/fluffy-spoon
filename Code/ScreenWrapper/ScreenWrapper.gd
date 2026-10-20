extends Area2D
class_name ScreenWrapper 

func _process(delta: float) -> void:
	if position.x < 0:
		position.x= get_viewport().size.x
	if position.y < 0: 
		position.y = get_viewport().size.y
	if position.x > get_viewport().size.x:
		position.x = 0
	if position.y > get_viewport().size.y: 
		position.y = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previou
