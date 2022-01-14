extends Particles2D

# TITLE : particles
# Functions : _on_PEG_emitParticles
# Purpose : to emit particles when commanded to 
# Closely Connected Scripts : Peg


# Recieved From : Peg
# Purpose : emit particles
func _on_PEG_emitParticles():
	self.emitting = true
	
