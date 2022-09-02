extends Node


signal thotsStyle
signal emote(emotion)
signal playSound(sound)
signal exits(character)
signal showScene(scene)
signal enters(character)

var playerName = ""

func setPlayerName(name :String) -> void: 
	playerName = name;

func getPlayerName() -> String:
	return playerName

var playerDict: Dictionary = {
	"thots" : emit_signal("thotsStyle")
}



func resolveTag(tag: String):
	var prefix : String = tag.get_slice("_", 0)
	var suffix : String = tag.get_slice("_", 1)
	prefix = prefix.to_lower();
	suffix = suffix.to_lower();

	match prefix:
		"e":
			emit_signal("emote", suffix)
		"p":
			playerDict[suffix]
		"se":
			emit_signal("playSound", suffix)
		"exits":
			emit_signal("exits", suffix)
			print("exits")
		"sc":
			emit_signal("showScene", suffix)
		"ve":
			printerr("ve not implemented yet!")
		"enters":
			emit_signal("enters", suffix)
		_:
			printerr("the tag with the prefix: " + prefix + " and the suffix: " + suffix +" couldn't be parsed!")


