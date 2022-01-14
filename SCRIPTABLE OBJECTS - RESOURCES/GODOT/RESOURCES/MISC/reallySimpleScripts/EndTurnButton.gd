extends Button

# TITLE : EndTurnButton
# Functions : _on_EndTurnButton_pressed, _on_enemySpawnBallZone_startPlayerTurn
# Purpose : Ends Player's Turn
# Closely Connected Scripts :  enemySpawnBallZone



# Recieved From : EndTurnButton
# Purpose : disables self
func _on_EndTurnButton_pressed():
	self.disabled = true

# Recieved From : enemySpawnBallZone
# Purpose : enables self
func _on_enemySpawnBallZone_startPlayerTurn():
	self.disabled = false
