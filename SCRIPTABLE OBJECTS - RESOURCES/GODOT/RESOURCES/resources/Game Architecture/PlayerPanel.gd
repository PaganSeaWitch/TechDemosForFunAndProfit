extends Panel


var playerResource

enum location {BOARD = 0, RESERVE = 1, DISCARD = 2}

signal sendTitle(name)
signal sendHealthToBar(currentHealth, maxHealth)
signal sendHealthToText(currentHealth, maxHealth)
signal setTexture(texture)
signal addToReserve(arrayOfBalls, amt)
signal addToDiscard(arrayOfBalls)
signal removeFromDiscard(ball, location)
signal removeAmtFromReserve(amt, location)
signal removeFromReserve(ball, location)
signal setMoney(amt)
signal setEnergy(current, maxEnergy)
signal startEnemyTurn
signal addToBoard(ball)


# Called every frame. 'delta' is the elapsed time since the previous frame.
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


func _on_sendToNewLocation(ball, local):
	match(local):
		location.BOARD:
			emit_signal("addToBoard", ball)
		location.RESERVE:
			emit_signal("addToReserve", [ball])
		location.DISCARD:
			emit_signal("addToDiscard", [ball])


func _on_EndTurnButton_pressed():
	emit_signal("setEnergy", String(playerResource.maxEnergy), String(playerResource.maxEnergy))
	emit_signal("startEnemyTurn")


func _on_enemySpawnBallZone_startPlayerTurn():
	emit_signal("removeAmtFromReserve", 5, location.BOARD)
	



func _on_spawnBallsIntoCup_addToDiscard(ball):
	_on_sendToNewLocation(ball, location.DISCARD)


func sendPayloadToPlayer(key, value):
	match(key):
		"Health":
			playerResource.currentHealth += value
			if(playerResource.currentHealth < 0):
				playerResource.currentHealth = 0;
			emit_signal("sendHealthToBar", playerResource.currentHealth, playerResource.maxHealth)
			emit_signal("sendHealthToText", playerResource.currentHealth, playerResource.maxHealth)



