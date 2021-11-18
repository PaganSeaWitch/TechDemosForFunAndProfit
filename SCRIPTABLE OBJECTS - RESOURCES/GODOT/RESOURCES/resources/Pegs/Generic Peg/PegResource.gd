extends Resource
class_name PegResource

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(int) var hitsAllowed

# Called when the node enters the scene tree for the first time.
func _init(hitsAllowed = 5):
	self.hitsAllowed = hitsAllowed
