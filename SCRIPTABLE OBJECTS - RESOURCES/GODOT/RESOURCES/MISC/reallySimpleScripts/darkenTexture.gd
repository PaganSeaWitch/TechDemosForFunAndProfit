extends MeshInstance2D

# TITLE : 
# Functions : 
# Purpose :
# Closely Connected Scripts : 

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

var startingRed
var startingBlue
var startingGreen

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	var color = self.texture.gradient.get_color(0)
	startingRed = color.r
	startingBlue = color.b
	startingGreen = color.g


func _on_PEG_getDarker(amt):
	var newRed = startingRed/amt;
	var newBlue = startingBlue/amt;
	var newGreen = startingGreen/amt;
	self.texture.gradient.set_color(0, Color(newRed,newGreen, newBlue));




