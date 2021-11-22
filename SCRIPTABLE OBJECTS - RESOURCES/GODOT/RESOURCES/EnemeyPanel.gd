extends Panel


export(Resource) var enemyResource

signal sendTitle(titleText)
signal sendHealthToBar(health)
signal sendHealthToText(currentHealth, maxHealth)
signal setTexture(texture)
signal setBall(ball, index)


var index := 0;
# Called when the node enters the scene tree for the first time.
func _ready():
	var resource = enemyResource as EnemyResource
	emit_signal("sendTitle", resource.name + "\n" + resource.description)
	emit_signal("sendHealthToBar", resource.health)
	emit_signal("sendHealthToText", resource.health, resource.health)
	emit_signal("setTexture", resource.texture)
	for i in resource.moves[0].moveSet.size():
		emit_signal("setBall",resource.moves[0].moveSet[i], i)
