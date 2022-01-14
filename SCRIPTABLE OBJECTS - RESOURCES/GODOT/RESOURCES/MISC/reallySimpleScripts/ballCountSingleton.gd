extends Node

# TITLE : BallCountSingleton
# Functions : decreaseBallCount, increaseBallCount
# Purpose : Acts a mutex for ensuring no more than 1 ball drops at a time
# Closely Connected Scripts :  enemySpawnBallZone, GarbageCollector, Ball

var ballCurrentCount := 0

func decreaseBallCount():
	ballCurrentCount -= 1


func increaseBallCount():
	ballCurrentCount += 1


