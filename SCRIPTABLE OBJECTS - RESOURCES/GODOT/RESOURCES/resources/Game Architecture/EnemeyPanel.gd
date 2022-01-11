extends Panel


var enemyResource

signal sendTitle(name, description)
signal sendHealthToBar(currentHealth, maxHealth)
signal sendHealthToText(currentHealth, maxHealth)
signal setTexture(texture)
signal setBall(ball, index)
signal clearBalls
signal startSpawningBalls(ballArray)
var index := 0;
var moves = []

# Called when the node enters the scene tree for the first time.
func _on_sendEnemyResource(enemy):
	enemyResource = enemy as EnemyResource
	emit_signal("sendTitle", enemyResource.name ,enemyResource.description)
	emit_signal("sendHealthToBar", enemyResource.currentHealth, enemyResource.maxHealth)
	emit_signal("sendHealthToText", enemyResource.currentHealth, enemyResource.maxHealth)
	emit_signal("setTexture", enemyResource.texture)
	var array = enemyResource.moves[index].moveSet.duplicate()
	for i in array.size():
		emit_signal("setBall",array[i], i)


func _on_Player_Panel_startEnemyTurn():
	var array = enemyResource.moves[index].moveSet.duplicate()
	emit_signal("clearBalls")
	emit_signal("startSpawningBalls", array)
	index = index + 1
	if(index >= enemyResource.moves.size()):
		index = 0;


func _on_enemySpawnBallZone_startPlayerTurn():
	var array = enemyResource.moves[index].moveSet.duplicate()
	for i in array.size():
		emit_signal("setBall",array[i], i)


func sendPayloadToEnemy(key, value):
	match(key):
		"Health":
			enemyResource.currentHealth += value
			if(enemyResource.currentHealth < 0):
				enemyResource.currentHealth = 0;
			emit_signal("sendHealthToBar", enemyResource.currentHealth, enemyResource.maxHealth)
			emit_signal("sendHealthToText", enemyResource.currentHealth, enemyResource.maxHealth)


