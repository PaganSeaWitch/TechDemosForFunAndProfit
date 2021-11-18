extends StaticBody2D
class_name Peg

signal emitParticles
signal addHit(amt)
signal startTextTimer
signal getDarker(amt)
signal changeColor(colorArray)
var hitsAllowed = 5
var hasHits = 0




func emit():
	self.emit_signal("emitParticles")


func changeColor(colorArray):
	var color
	if(colorArray.size() > 1):
		var rand = rand_range(0, colorArray.size())
		color = colorArray[rand]
	else:
		color = colorArray[0]
	var peg = color.instance()
	changePeg(peg)


func resetAndRemove():
	self.get_child(0).visible = false
	self.get_child(0).set_deferred("disabled", true)
	hasHits = 0
	self.emit_signal("startTextTimer")
	self.emit_signal("getDarker", 1)


func addHit(hitAmt):
	hasHits += hitAmt;
	if(hasHits == 0):
		return
	self.emit_signal("addHit", hasHits)
	self.emit_signal("getDarker", hasHits)
	if(hasHits >= hitsAllowed):
		resetAndRemove()
	emit()


func changePeg(peg):
	get_parent().call_deferred("add_child", peg)
	get_parent().call_deferred("move_child", peg, self.get_index())
	peg.set_deferred("position", self.position) 
	peg.call_deferred("set_scale",self.get_scale())
	peg.call_deferred("addHit",self.hasHits)
	peg.call_deferred("emit")
	self.call_deferred("queue_free")
	get_parent().call_deferred("remove_child",self)


func place():
	self.get_child(0).visible = true
	self.get_child(0).set_deferred("disabled", false)

func _on_Area2D_area_entered(area):
	self.queue_free()
