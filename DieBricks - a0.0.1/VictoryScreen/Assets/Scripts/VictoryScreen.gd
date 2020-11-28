extends Control

var path = " "
const ball_scene = preload("res://mini scenes/Ball_scenes.tscn")
var ball = ball_scene.instance()

func _ready():
	$Menu/CenterRow/Buttons/RetryButton.grab_focus()


func _on_RetryButton_pressed():
	path = "res://LevelOne.tscn"
	get_tree().call_group("Balls", "queue_free")
	$FadeIn.show()
	$FadeIn.fade_in()
	$Menu.hide()
	return path


func _on_LevelsButton_pressed():
	path = "res://Level/LevelSelect.tscn"
	$FadeIn.show()
	$FadeIn.fade_in()
	$Menu.hide()
	return path


func _on_GoBackButton_pressed():
	path = "res://TitleScreen/TitleScreen.tscn"
	get_tree().call_group("Balls", "queue_free")
	$FadeIn.show()
	$FadeIn.fade_in()
	$Menu.hide()
	return path

func _on_FadeIn_fade_finished():
	get_tree().change_scene(path)
