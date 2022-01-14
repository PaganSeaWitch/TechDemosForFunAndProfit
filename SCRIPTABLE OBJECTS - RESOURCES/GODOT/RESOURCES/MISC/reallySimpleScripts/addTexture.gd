extends MeshInstance2D

# TITLE : addTexture
# Functions : _on_addTexture
# Purpose : To add texture ot MeshInstance2D
# Closely Connected Scripts : Ball

# Recieved From : Ball
# Purpose : sets texture
func _on_addTexture(texture : Texture):
	self.texture = texture
