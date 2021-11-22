extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BALL_addText(name):
	self.bbcode_enabled = true
	self.bbcode_text = "[center]" + name +"[/center]"


func _on_EnemyPanel_sendTitle(name, description):
	self.bbcode_enabled = true
	self.bbcode_text = "[center]"+ name + "\n" + description +"[/center]"
