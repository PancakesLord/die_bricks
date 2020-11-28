extends Node2D


var remaining = int(49) setget set_score
var lives = int(3) setget set_lives
var ball_left = int(3)
var ball_scene = preload("res://mini scenes/Ball_scenes.tscn")
var ball = ball_scene.instance()

func set_score(value):
	remaining = value
	get_node("Layer0/Game/InGameUI/Remaining").set_text("Bricks:" + str(remaining))
#on va créer un getter (savoir qd une var change) et un setter (modificateur d'élément 
#en fonc' d'un getter)

func set_lives(value):
	lives = value
	get_node("/root/Level/Layer0/Game/InGameUI/Lives").set_text("Lives: " + str(lives))



func _process(delta):
	if lives == 0:
		var path = get_tree().current_scene.get_path()
		get_tree().call_group("Balls", "queue_free")
		$Layer0/Game.hide()
		$Layer2/GameOverScreen.show()
		
	if remaining == 0:
		lives = 10
		$Layer0/Game.hide()
		$Layer3/VictoryScreen.show()

	if remaining < 0:
		pass

	if lives < 0:
		pass
