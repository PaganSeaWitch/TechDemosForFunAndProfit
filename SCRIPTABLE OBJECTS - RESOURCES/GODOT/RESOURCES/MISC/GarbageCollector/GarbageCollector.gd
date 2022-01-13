extends Area2D
# TITLE : GarbageCollector
# Functions : _on_Area2D_body_entered, _on_Area2D2_body_exited, resolvePayload
# Purpose : To Properly Dispose of Balls and To Administer Their Effects
# Closely Connected Scripts : 


# connected To : 
# Purpose : 
signal sendBallToDiscard(ball)

# connected To : 
# Purpose : 
signal sendPayloadToEnemy(key, value)

# connected To : 
# Purpose : 
signal sendPayloadToPlayer(key, value)


export(String) var teamZone : String


# Recieved From : GarbageCollector
# Purpose : 
func _on_Area2D_body_entered(body):
	if(body is PachinkoBall):
		if(!body.is_in_group(teamZone)):
			var payload = body.payloadDictionary;
			if(payload.size() != 0):
				resolvePayload(payload)
			body.get_parent().call_deferred("queue_free")
			BallCountSingleton.decreaseBallCount()
			print(BallCountSingleton.ballCurrentCount)
			if(teamZone == "Enemy"):
				emit_signal("sendBallToDiscard", body.get_parent())
		if(body.is_in_group(teamZone) && teamZone == "Player"):
			body.rightSpot = true


# Recieved From : 
# Purpose : 
func _on_Area2D2_body_exited(body):
	if(body is PachinkoBall):
		if(body.is_in_group(teamZone) && teamZone == "Player"):
			print("left the zone")
			body.rightSpot = false

# Purpose : 
func resolvePayload(payload):
	print(payload)
	if(payload.has("Enemy")):
		for i in payload["Enemy"]:
			emit_signal("sendPayloadToEnemy",i, payload["Enemy"][i])
	if(payload.has("Player")):
		for i in payload["Player"]:
			emit_signal("sendPayloadToPlayer", i, payload["Player"][i])
