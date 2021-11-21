extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(bool) var changeToStatic
export(Resource) var ballResource

signal transferResources(ballResource)
# Called when the node enters the scene tree for the first time.
func _ready():
	emit_signal("transferResources", ballResource)
