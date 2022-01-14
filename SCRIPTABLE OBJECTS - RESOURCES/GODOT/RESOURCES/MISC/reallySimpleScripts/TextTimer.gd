extends Timer

# TITLE : TextTimer
# Functions : _on_PEG_startTextTimer
# Purpose : To start the timer when peg asks
# Closely Connected Scripts : Peg

# Recieved From : Peg
# Purpose : Start Timer
func _on_PEG_startTextTimer():
	self.start();
