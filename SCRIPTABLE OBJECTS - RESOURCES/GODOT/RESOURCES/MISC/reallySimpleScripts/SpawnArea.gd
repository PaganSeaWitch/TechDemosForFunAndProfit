extends CollisionShape2D

# TITLE : 
# Functions : 
# Purpose :
# Closely Connected Scripts : 


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print(self.get_shape().get_extents())


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
