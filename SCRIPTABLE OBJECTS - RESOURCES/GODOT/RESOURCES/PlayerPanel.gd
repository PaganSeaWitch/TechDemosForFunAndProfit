extends Panel


export(Resource) var playerResource

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
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	var resource = playerResource as PlayerResource
	emit_signal("sendTitle", resource.name)
	emit_signal("sendHealthToBar", resource.currentHealth, resource.maxHealth)
	emit_signal("sendHealthToText", resource.currentHealth, resource.currentHealth)
	emit_signal("setTexture", resource.texture)
	emit_signal("addToDiscard", resource.balls)
	emit_signal("setEnergy", String(resource.maxEnergy), String(resource.maxEnergy))
	emit_signal("setMoney", String(resource.money))



func _on_sendToNewLocation(ball, local):
	match(local):
		location.BOARD:
			pass
		location.RESERVE:
			emit_signal("addToReserve", [ball])
		location.DISCARD:
			emit_signal("addToDiscard", [ball])
