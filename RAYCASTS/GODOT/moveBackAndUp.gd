extends MoveBack


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print(get_parent().get_parent().get_instance_id())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func hit(id):
	.hit(id)
	instance_from_id(id).get_parent().translate(Vector3(-.5,0,0))
