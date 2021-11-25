extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal setStuffs( upperLeft, upperRight, bottomLeft, BottomRight, minPeg, maxPeg)

export var minPeg : int
export var maxPeg : int


func _on_tempArea_givePos(upperleft, upperRight, bottomLeft, bottomRight):
	emit_signal("setStuffs", upperleft, upperRight, bottomLeft, bottomRight, minPeg, maxPeg)




func _on_enemySpawnBallZone_resetPegs():
	get_tree().call_group("Pegs", "reset")
