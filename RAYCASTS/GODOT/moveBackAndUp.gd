extends MoveBack


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func hit(type):
	.hit(type)
	
	if(type is PlayerHit):
		emit_signal("acceptable_raycast_hit", Vector3(-.1, 0, 0))
