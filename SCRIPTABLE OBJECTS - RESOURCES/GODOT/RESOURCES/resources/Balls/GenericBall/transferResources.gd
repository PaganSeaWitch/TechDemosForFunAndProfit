extends Node2D


export(bool) var ballIsStatic
export(Resource) var ballResource

signal transferResources(ballResource)
signal changeToStatic
signal flipGravity
signal setTeam(team)
signal stopBouncing
signal draggable(canBeDragged)



func _ready():
	if(ballIsStatic):
		emit_signal("changeToStatic")
	emit_signal("transferResources", ballResource)



func flipBallGravity():
	emit_signal("flipGravity")


func setBallTeam(team):
	if(team == 'Enemy'):
		emit_signal('setTeam', team)
	if(team == 'Player'):
		emit_signal('setTeam', team)

func stopBouncingPhysics():
	emit_signal("stopBouncing")

func draggable(canBeDragged):
	emit_signal("draggable", canBeDragged)


func changeHits():
	if(ballResource is ActionBallResource):
		ballResource.setHits()
		for i in ballResource.currentHits.size():
			if(ballResource.currentHits[i] is PayloadModifierHit):
				if(ballResource.currentHits[i].team == "Enemy" && ballResource.currentHits[i].team == ballResource.hits[i].team):
					ballResource.currentHits[i].team = "Player"
				elif(ballResource.currentHits[i].team == "Player" && ballResource.currentHits[i].team == ballResource.hits[i].team):
					ballResource.currentHits[i].team = "Enemy"

