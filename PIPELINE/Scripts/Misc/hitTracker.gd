extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"






func _on_PEG_addHit(amt):
	self.text = String(amt);


func _on_Timer_timeout():
	self.text = ""
