extends VBoxContainer

# TITLE : 
# Functions : 
# Purpose :
# Closely Connected Scripts : 


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(PackedScene) var panel = load("res://AbilityInfo/AbilityInfoPanel.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BALL_addInfo(abilitiesInfo):
	for i in abilitiesInfo:
		var newPanel = panel.instance();
		newPanel.abilityInfoResource = i
		self.add_child(newPanel)
