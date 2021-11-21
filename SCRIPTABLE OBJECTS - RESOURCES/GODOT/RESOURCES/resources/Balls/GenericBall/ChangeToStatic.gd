extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(bool) var changeToStatic

# Called when the node enters the scene tree for the first time.
func _ready():
	if(changeToStatic):
		get_child(0).mode = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
