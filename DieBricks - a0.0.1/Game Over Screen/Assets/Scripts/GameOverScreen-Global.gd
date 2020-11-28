extends Control

var path = " "

func _ready():
	$Menu/CenterRow/Buttons/RetryButton.grab_focus()


func _on_RetryButton_pressed():
	get_tree().call_group("Balls", "queue_free")
	$FadeOut.show()
	$FadeOut.fade_out()
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


func _on_FadeOut_animation_finished():
	$".".hide()
	$FadeOut.hide()
	get_tree().reload_current_scene()
