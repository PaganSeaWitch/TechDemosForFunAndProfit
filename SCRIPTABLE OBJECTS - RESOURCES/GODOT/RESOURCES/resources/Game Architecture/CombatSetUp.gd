extends Control

# TITLE : CombatSetUp
# Functions : initalizeCombat
# Purpose : sets Up Combat Scene
# Closely Connected Scripts : 


# Connected To : PlayerPanel
# Purpose : Sends Player Resources to PlayerPanel
signal sendPlayerResource(playerResource)


# Connected To : EnemyPanel
# Purpose : Sends Enemy Resources to EnemyPanel
signal sendEnemyResource(enemyResource)


enum EnemyType {COMMON = 1, ELITE = 2}


# Purpose : initlizes combat scene
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
