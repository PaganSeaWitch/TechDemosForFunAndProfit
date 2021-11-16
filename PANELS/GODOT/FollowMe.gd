extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var moveWith = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(moveWith):
		self.position = get_global_mouse_position()



func _on_Button_pressed():
	moveWith = !moveWith;
