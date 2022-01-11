extends Button


var combat = load("res://resources/Game Architecture/Combat.tscn")
var player = preload("res://resources/Player/Player.tres")
var enemyList = preload("res://resources/EnemyLists/Level_1.tres")

func _on_Button_pressed():
	var newCombatScene = combat.instance()
	newCombatScene.initalizeCombat(player, enemyList, newCombatScene.EnemyType.COMMON)
	get_tree().root.add_child(newCombatScene)
	get_tree().root.remove_child(get_parent())
	
