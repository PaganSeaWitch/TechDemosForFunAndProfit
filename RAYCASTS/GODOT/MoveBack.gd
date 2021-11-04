extends Hittable
class_name MoveBack

# Declare member variables here. Examples:
# var a = 2
# var b = "text"




# Called every frame. 'delta' is the elapsed time since the previous frame.
func hit(type):
	.hit(type)
	if(type is HitType):
		emit_signal("acceptable_raycast_hit", Vector3(0, -1 * type.force, 0))

