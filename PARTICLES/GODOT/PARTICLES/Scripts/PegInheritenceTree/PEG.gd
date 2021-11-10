extends StaticBody2D
class_name Peg

signal emitParticles
signal addHit(amt)
signal startTextTimer
signal getDarker(amt)
signal changeColor(colorArray)
var hitsAllowed = 5
var hasHits = 0

var yellowPegScene = load("res://Scenes//Peg Scenes//YellowPeg.tscn")


func emit():
	self.emit_signal("emitParticles")


func changeColor(colorArray):
	var color : Color
	if(colorArray.size() > 1):
		var rand = rand_range(0, colorArray.size())
		color = colorArray[rand]
	else:
		color = colorArray[0]
	var peg;
	match color:
		Color(255, 255, 0):
			peg = yellowPegScene.instance()
		_:
			peg = self
	changePeg(peg)


func resetAndRemove():
	self.get_child(0).visible = false
	self.get_child(0).set_deferred("disabled", true)
	hasHits = 0
	self.emit_signal("startTextTimer")
	self.emit_signal("getDarker", 1)


func addHit(hitAmt):
	hasHits += hitAmt;
	self.emit_signal("addHit", hasHits)
	self.emit_signal("getDarker", hasHits)
	if(hasHits >= hitsAllowed):
		resetAndRemove()
		


func changePeg(peg):
	get_parent().add_child(peg)
	get_parent().move_child(peg, self.get_index())
	peg.position = self.position
	peg.addHit(self.hasHits)
	peg.emit()
	self.queue_free()
	get_parent().remove_child(self)


func place():
	self.get_child(0).visible = true
	self.get_child(0).set_deferred("disabled", false)

func _on_Area2D_area_entered(area):
	self.queue_free()
