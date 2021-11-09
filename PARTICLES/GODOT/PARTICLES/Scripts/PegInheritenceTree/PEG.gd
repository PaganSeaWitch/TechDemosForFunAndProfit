extends StaticBody2D
class_name Peg

signal emitParticles
signal addHit(amt)
signal startTextTimer
signal getDarker(amt)
var hitsAllowed = 5
var hasHits = 0
func emit():
	self.emit_signal("emitParticles")

func addHit(hitAmt):
	hasHits += hitAmt;
	self.emit_signal("addHit", hasHits)
	var color = hasHits + 1
	self.emit_signal("getDarker", color)
	if(hasHits >= hitsAllowed):
		self.get_child(0).visible = false
		self.get_child(0).set_deferred("disabled", true)
		hasHits = 0
		self.emit_signal("startTextTimer")
		self.emit_signal("getDarker", 1)
		


