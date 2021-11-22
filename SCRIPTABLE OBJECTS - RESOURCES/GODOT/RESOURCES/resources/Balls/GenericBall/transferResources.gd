extends Node2D


export(bool) var changeToStatic
export(Resource) var ballResource

signal transferResources(ballResource)
signal changeToStatic
# Called when the node enters the scene tree for the first time.
func _ready():
	if(changeToStatic):
		emit_signal("changeToStatic")
	emit_signal("transferResources", ballResource)
