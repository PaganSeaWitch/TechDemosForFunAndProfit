extends VBoxContainer

# TITLE : abilitiesInfoContainer
# Functions : _on_BALL_addInfo
# Purpose : to instance an ablities panel
# Closely Connected Scripts : BALL



export(PackedScene) var panel = load("res://AbilityInfo/AbilityInfoPanel.tscn")

# Recieved From : Ball
# Purpose : setup abilities panel
func _on_BALL_addInfo(abilitiesInfo):
	for i in abilitiesInfo:
		var newPanel = panel.instance();
		newPanel.abilityInfoResource = i
		self.add_child(newPanel)
