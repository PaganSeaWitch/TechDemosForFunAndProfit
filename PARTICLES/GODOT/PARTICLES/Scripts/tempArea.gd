extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal givePos(upperleft, upperRight, bottomLeft, bottomRight)

# Called when the node enters the scene tree for the first time.
func _ready():
	var upperLeft = self.get_child(0)
	var upperRight = self.get_child(1)
	var bottomLeft = self.get_child(2)
	var bottomRight = self.get_child(3)
	emit_signal("givePos", upperLeft, upperRight, bottomLeft, bottomRight)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
