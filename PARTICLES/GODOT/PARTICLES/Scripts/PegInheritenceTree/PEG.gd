extends StaticBody2D
class_name Peg

signal emitParticles
signal addHit(amt)
signal startTextTimer
signal getDarker(amt)
signal changeColor(colorArray)
var hitsAllowed = 5
var hasHits = 0

var yellowPegScene = load("res://Scenes//YellowPeg.tscn")
func emit():
	self.emit_signal("emitParticles")

func changeColor(colorArray):
	var color : Color
	if(colorArray.size() > 1):
		var rand = rand_range(0, colorArray.size())
		color = colorArray[rand]
	else:
		color = colorArray[0]
	if(color == Color(255, 255, 0)):
		var yellowPeg = yellowPegScene.instance()
		get_parent().add_child(yellowPeg)
		get_parent().move_child(yellowPeg, self.get_index())
		yellowPeg.position = self.position
		yellowPeg.addHit(self.hasHits)
		yellowPeg.emit()
		self.queue_free()
		get_parent().remove_child(self)


func addHit(hitAmt):
	hasHits += hitAmt;
	self.emit_signal("addHit", hasHits)
	self.emit_signal("getDarker", hasHits)
	if(hasHits >= hitsAllowed):
		self.get_child(0).visible = false
		self.get_child(0).set_deferred("disabled", true)
		hasHits = 0
		self.emit_signal("startTextTimer")
		self.emit_signal("getDarker", 1)
		


