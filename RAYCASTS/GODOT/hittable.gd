extends StaticBody
class_name Hittable

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal acceptable_raycast_hit(payload)

func hit(type):
	print("HIT by " + type.getHitType() + "!")



