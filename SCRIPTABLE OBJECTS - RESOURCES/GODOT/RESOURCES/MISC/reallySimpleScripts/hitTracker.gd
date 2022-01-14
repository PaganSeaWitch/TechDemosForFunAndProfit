extends RichTextLabel

# TITLE : hitTracker
# Functions : _on_PEG_addHit, _on_Timer_timeout
# Purpose : Puts a number in the peg to display how many hits left
# Closely Connected Scripts : Peg, TextTimer

# Recieved From : Peg
# Purpose : display hits left
func _on_PEG_addHit(amt : int):
	self.text = String(amt);

# Recieved From : TextTimer
# Purpose : remove label
func _on_Timer_timeout():
	self.text = ""
