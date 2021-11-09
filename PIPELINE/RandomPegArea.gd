extends CollisionShape2D

signal startMakingPegs(minPegs, maxPegs)

func _on_RandomPegZone_changeScale(size, minPegs, maxPegs):
	self.set_scale(size)
	emit_signal("startMakingPegs", minPegs, maxPegs)
