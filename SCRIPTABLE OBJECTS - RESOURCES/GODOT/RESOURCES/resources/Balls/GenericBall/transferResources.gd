extends Node2D

# TITLE : 
# Functions : 
# Purpose :
# Closely Connected Scripts : 


export(bool) var ballIsStatic
export(Resource) var ballResource

# Connected To : 
# Purpose : 
signal transferResources(ballResource)

# Connected To : 
# Purpose : 
signal changeToStatic

# Connected To : 
# Purpose : 
signal flipGravity

# Connected To : 
# Purpose : 
signal setTeam(team)

# Connected To : 
# Purpose : 
signal stopBouncing

# Connected To : 
# Purpose : 
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

