extends Node2D
# TITLE : RandomPegZone
# Functions : _on_tempArea_givPos, _on_enemySpawnBallZone_resetPegs
# Purpose : Creates a zone for pegs to spawn in
# Closely Connected Scripts : CreateBoard, TempArea, enemySpawnBallZone

# connected To : CreateBoard
# Purpose : tells the board necessary info the set itself up
signal setStuffs( upperLeft, upperRight, bottomLeft, BottomRight, minPeg, maxPeg)

export var minPeg : int
export var maxPeg : int

# Recieved From : TempArea
# Purpose : Recieves Info Needed For the Board To Be setup and sends it to board
func _on_tempArea_givePos(upperleft : Node2D, upperRight : Node2D, bottomLeft : Node2D, bottomRight :Node2D):
	emit_signal("setStuffs", upperleft, upperRight, bottomLeft, bottomRight, minPeg, maxPeg)

# Recieved From : enemySpawnBallZone
# Purpose : Resets all pegs on the board
func _on_enemySpawnBallZone_resetPegs():
	get_tree().call_group("Pegs", "reset")
