extends Control

signal sendPlayerResource(playerResource)
signal sendEnemyResource(enemyResource)
func initalizeCombat(playerResource : PlayerResource, enemyResourceArray : Array):
	emit_signal("sendPlayerResource", playerResource)
	var rand = RandomNumberGenerator.new()
	var index = rand.randi_range(0, enemyResourceArray.size())
	emit_signal("sendEnemyResource", enemyResourceArray[index])
