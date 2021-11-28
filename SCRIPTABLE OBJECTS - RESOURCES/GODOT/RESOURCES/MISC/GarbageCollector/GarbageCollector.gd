extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(String) var teamZone
signal sendBallToDiscard(ball)
signal sendPayloadToEnemy(key, value)
signal sendPayloadToPlayer(key, value)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func resolvePayload(payload):
	print(payload)
	if(payload.has("Enemy")):
		for i in payload["Enemy"]:
			emit_signal("sendPayloadToEnemy",i, payload["Enemy"][i])
	if(payload.has("Player")):
		for i in payload["Player"]:
			emit_signal("sendPayloadToPlayer", i, payload["Player"][i])


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


func _on_Area2D2_body_exited(body):
	if(body is PachinkoBall):
		if(body.is_in_group(teamZone) && teamZone == "Player"):
			print("left the zone")
			body.rightSpot = false
