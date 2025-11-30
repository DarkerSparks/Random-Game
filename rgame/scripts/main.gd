extends Node2D

@export var mob_scene: PackedScene
var score

func _ready() -> void:
	new_game()

func game_over():
	$ScoreTimer.stop()
	$Enemy_Timer.stop()

func new_game():
	score = 0
	$Player.start($Start_Position.position)
	$Start_Timer.start()
