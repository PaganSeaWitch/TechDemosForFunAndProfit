extends RichTextLabel

# TITLE : addText
# Functions : _on_BALL_addText, _on_EnemyPanel_sendTitle, _on_sendTitle_rightCentered,
#		_on_setText_default, _on_sendEnergy_rightCentered
# Purpose : To set Text To Specific labels
# Closely Connected Scripts : EnemyPanel, PlayerPanel, Ball


# Recieved From : Ball, PlayerPanel
# Purpose : Center text labels
func _on_centerText(name : String):
	self.bbcode_enabled = true
	self.bbcode_text = "[center]" + name +"[/center]"


# Recieved From : EnemyPanel
# Purpose : Center Enemy title label
func _on_EnemyPanel_sendTitle(name : String, description : String):
	self.bbcode_enabled = true
	self.bbcode_text = "[center]"+ name + "\n" + description +"[/center]"


# Recieved From : PlayerPanel
# Purpose : Right aligns text
func _on_sendTitle_rightCentered(text : String):
	self.bbcode_enabled = true
	self.bbcode_text = "[right]" + text + "[/right]"


# Recieved From : N/A
# Purpose : sets default text
func _on_setText_default(text : String):
	self.bbcode_enabled = true
	self.bbcode_text =  text


# Recieved From : PlayerPanel
# Purpose : rights energy label
func _on_sendEnergy_rightCentered(current : String, maxEnergy : String):
	self.bbcode_enabled = true
	self.bbcode_text = "[right]" + current + "/" + maxEnergy + "[/right]"


# Recieved From : PlayerPanel, EnemyPanel
# Purpose : centers health lable
func _on_Panel_sendHealthToText(currentHealth : int, maxHealth : int):
	bbcode_text = "[center]"+String(currentHealth) + "/" + String(maxHealth)+ "[/center]"
