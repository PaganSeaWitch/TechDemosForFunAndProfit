extends TextureRect

# TITLE : addRectTexture
# Functions : _on_setTexture
# Purpose : To Set A texture on a TextureRect
# Closely Connected Scripts : EnemyPanel, PlayerPanel

# Recieved From : EnemyPanel, PlayerPanel
func _on_setTexture(texture : Texture):
	self.texture = texture;
