extends Panel

# TITLE : EnemyPanel
# Functions : _on_sendEnemyResource, _on_Player_Panel_startEnemyTurn,
#		_on_enemySpawnBallZone_startPlayerTurn, sendPayloadToEnemy
# Purpose : Sets up and regulates the Enemy Panel
# Closely Connected Scripts : showBall, HealthBar, addText, addRectTexture,
#		CombatSetUp, enemySpawnBallZone, PlayerPanel


# Connected To : showBall
# Purpose : sends title to label
signal sendTitle(name, description)


# Connected To : HealthBar
# Purpose : sends health to health bar
signal sendHealthToBar(currentHealth, maxHealth)


# Connected To : addText
# Purpose : sends health to label
signal sendHealthToText(currentHealth, maxHealth)


# Connected To : addRectTexture
# Purpose : sets texture
signal setTexture(texture)


# Connected To : showBall
# Purpose : sets an a ball at a specific index on the move panel
signal setBall(ball, index)


# Connected To : showBall
# Purpose : clears the balls from the move panel
signal clearBalls


var index := 0
var moves := []
var enemyResource : EnemyResource


# Recieved From : CombatSetUp
# Purpose : sets up the enemy resource and labels
func _on_sendEnemyResource(enemy):
	enemyResource = enemy as EnemyResource
	emit_signal("sendTitle", enemyResource.name ,enemyResource.description)
	emit_signal("sendHealthToBar", enemyResource.currentHealth, enemyResource.maxHealth)
	emit_signal("sendHealthToText", enemyResource.currentHealth, enemyResource.maxHealth)
	emit_signal("setTexture", enemyResource.texture)
	var array = enemyResource.moves[index].moveSet.duplicate()
	for i in array.size():
		emit_signal("setBall",array[i], i)


# Recieved From : PlayerPanel
# Purpose : starts enemy turn
func _on_Player_Panel_startEnemyTurn():
	var array = enemyResource.moves[index].moveSet.duplicate()
	emit_signal("clearBalls")
	emit_signal("startSpawningBalls", array)
	index = index + 1
	if(index >= enemyResource.moves.size()):
		index = 0;


# Recieved From : enemySpawnBallZone
# Purpose : sets up enemy move panel
func _on_enemySpawnBallZone_startPlayerTurn():
	var array = enemyResource.moves[index].moveSet.duplicate()
	for i in array.size():
		emit_signal("setBall",array[i], i)


# Purpose : sends payload to labels on panel
func sendPayloadToEnemy(key, value):
	match(key):
		"Health":
			enemyResource.currentHealth += value
			if(enemyResource.currentHealth < 0):
				enemyResource.currentHealth = 0;
			emit_signal("sendHealthToBar", enemyResource.currentHealth, enemyResource.maxHealth)
			emit_signal("sendHealthToText", enemyResource.currentHealth, enemyResource.maxHealth)
