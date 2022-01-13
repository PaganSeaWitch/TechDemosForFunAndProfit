extends Button

# TITLE: CreateFight 
# Functions: _on_Button_pressed()
# Purpose : Loads up Combat Using External Resources


var combat = load("res://resources/Game Architecture/Combat.tscn")

#Placeholder resources for functionality testing
var player = preload("res://resources/Player/Player.tres")
var enemyList = preload("res://resources/EnemyLists/Level_1.tres")


#Changes the scene to combat after intializing combat
func _on_Button_pressed() -> void:
	var newCombatScene = combat.instance()
	newCombatScene.initalizeCombat(player, enemyList, newCombatScene.EnemyType.COMMON)
	get_tree().root.add_child(newCombatScene)
	get_tree().root.remove_child(get_parent())
