extends Control

enum EnemyType {COMMON = 1, ELITE = 2}

signal sendPlayerResource(playerResource)
signal sendEnemyResource(enemyResource)


func initalizeCombat(playerResource : PlayerResource, enemyList : EnemyList, enemyType : int):
	emit_signal("sendPlayerResource", playerResource)
	var rand = RandomNumberGenerator.new()
	
	match(enemyType):
		EnemyType.COMMON:
			var index = rand.randi_range(0, enemyList.commonEnemies.size()-1)
			emit_signal("sendEnemyResource", enemyList.commonEnemies[index])
		EnemyType.ELITE:
			var index = rand.randi_range(0, enemyList.eliteEnemies.size()-1)
			emit_signal("sendEnemyResource", enemyList.eliteEnemies[index])
