extends MeshInstance2D

# TITLE : darkenTexture
# Functions : _ready, _on_PEG_getDarker
# Purpose : Darkens a Peg's texture based on how many times they've been hit
# Closely Connected Scripts : Peg


var startingRed : float
var startingBlue : float
var startingGreen : float


# Recieved From : Peg
# Purpose : darkens the pegs texture
func _on_PEG_getDarker(amt):
	var newRed = startingRed/amt;
	var newBlue = startingBlue/amt;
	var newGreen = startingGreen/amt;
	self.texture.gradient.set_color(0, Color(newRed,newGreen, newBlue));


# Purpose : Gets the color of the texture
func _ready():
	var color = self.texture.gradient.get_color(0)
	startingRed = color.r
	startingBlue = color.b
	startingGreen = color.g

