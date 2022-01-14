extends Panel
# TODO MAKE STUFF
# TITLE : PlayerPanel
# Functions : _on_sendPlayerResource, _on_sendToNewLocation,
#		_on_EndTurnButton_pressed, _on_enemySpawnBallZone_startPlayerTurn,
#		_on_spawnBallsIntoCup_addToDiscard, sendPayloadToPlayer
# Purpose : Sets up and regulates Player Panel
# Closely Connected Scripts : 


# Connected To : 
# Purpose : 
signal sendTitle(name)


# Connected To : 
# Purpose : 
signal sendHealthToBar(currentHealth, maxHealth)


# Connected To : 
# Purpose : 
signal sendHealthToText(currentHealth, maxHealth)


# Connected To : 
# Purpose : 
signal setTexture(texture)


# Connected To : 
# Purpose : 
signal addToReserve(arrayOfBalls, amt)


# Connected To : 
# Purpose : 
signal addToDiscard(arrayOfBalls)


# Connected To : 
# Purpose : 
signal removeFromDiscard(ball, location)


# Connected To : 
# Purpose : 
signal removeAmtFromReserve(amt, location)


# Connected To : 
# Purpose : 
signal removeFromReserve(ball, location)


# Connected To : 
# Purpose : 
signal setMoney(amt)


# Connected To : 
# Purpose : 
signal setEnergy(current, maxEnergy)


# Connected To : 
# Purpose : 
signal startEnemyTurn


# Connected To : 
# Purpose : 
signal addToBoard(ball)


var playerResource : PlayerResource
enum location {BOARD = 0, RESERVE = 1, DISCARD = 2}


# Recieved From : 
# Purpose : 
func _on_sendPlayerResource(player):
	playerResource = player as PlayerResource
	emit_signal("sendTitle", playerResource.name)
	emit_signal("sendHealthToBar", playerResource.currentHealth, playerResource.maxHealth)
	emit_signal("sendHealthToText", playerResource.currentHealth, playerResource.currentHealth)
	emit_signal("setTexture", playerResource.texture)
	emit_signal("addToReserve", playerResource.balls)
	emit_signal("setEnergy", String(playerResource.maxEnergy), String(playerResource.maxEnergy))
	emit_signal("setMoney", String(playerResource.money))
	emit_signal("removeAmtFromReserve", 5, location.BOARD)


# Recieved From : 
# Purpose : 
func _on_sendToNewLocation(ball, local):
	match(local):
		location.BOARD:
			emit_signal("addToBoard", ball)
		location.RESERVE:
			emit_signal("addToReserve", [ball])
		location.DISCARD:
			emit_signal("addToDiscard", [ball])

# Recieved From : 
# Purpose : 
func _on_EndTurnButton_pressed():
	emit_signal("setEnergy", String(playerResource.maxEnergy), String(playerResource.maxEnergy))
	emit_signal("startEnemyTurn")

# Recieved From : 
# Purpose : 
func _on_enemySpawnBallZone_startPlayerTurn():
	emit_signal("removeAmtFromReserve", 5, location.BOARD)

# Recieved From : 
# Purpose : 
func _on_spawnBallsIntoCup_addToDiscard(ball):
	_on_sendToNewLocation(ball, location.DISCARD)

# Recieved From : 
# Purpose : 
func sendPayloadToPlayer(key, value):
	match(key):
		"Health":
			playerResource.currentHealth += value
			if(playerResource.currentHealth < 0):
				playerResource.currentHealth = 0;
			emit_signal("sendHealthToBar", playerResource.currentHealth, playerResource.maxHealth)
			emit_signal("sendHealthToText", playerResource.currentHealth, playerResource.maxHealth)
