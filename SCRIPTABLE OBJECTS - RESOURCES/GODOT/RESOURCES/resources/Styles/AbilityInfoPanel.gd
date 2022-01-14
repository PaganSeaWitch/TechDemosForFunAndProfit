extends Control

# TITLE : AbilityInfoPanel
# Functions : _Ready
# Purpose : Creates a visualization of one of a ball's hit ablities
# Closely Related Scripts : AbilityInfoResource

export(Resource) var abilityInfoResource

# Sets up nodes within the AbilityInfoPanel Scene to contain relevant ablity info
func _ready() -> void:
	get_child(0).text = String(abilityInfoResource.amount)
	get_child(1).texture = abilityInfoResource.type
	if(abilityInfoResource.perAmount == 0):
		get_child(2).text = ""
	else:
		get_child(2).text = "Per " + String(abilityInfoResource.perAmount)
		var newPeg = abilityInfoResource.peg.instance()
		newPeg.collision_layer = 0
		newPeg.collision_mask = 0
		newPeg.get_child(3).collision_layer = 0
		newPeg.get_child(3).collision_mask = 0
		get_child(3).add_child(newPeg)

