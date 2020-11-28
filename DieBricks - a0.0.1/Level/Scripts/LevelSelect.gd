extends Control

var path = " "

func _ready():
	$FadeIn.hide()
	$Menu/ClassicLevels/LevelOne.grab_focus()

func _on_LevelOne_pressed():
	path = "res://LevelOne.tscn"
	$FadeIn.show()
	$FadeIn.fade_in()
	$Menu.hide()
	return path

func _on_LevelTwo_pressed():
	pass # Replace with function body.


func _on_LevelThree_pressed():
	pass # Replace with function body.


func _on_LevelFour_pressed():
	pass # Replace with function body.


func _on_LevelFive_pressed():
	pass # Replace with function body.


func _on_LevelSix_pressed():
	pass # Replace with function body.


func _on_LevelSeven_pressed():
	pass # Replace with function body.


func _on_LevelEight_pressed():
	pass # Replace with function body.


func _on_HalloweenOne_pressed():
	path = "res://Level/Levels/Halloween/HalloweenLevel.tscn"
	$FadeIn.show()
	$FadeIn.fade_in()
	$Menu.hide()
	return path


func _on_Christmas_pressed():
	pass # Replace with function body.


func _on_Easter_pressed():
	pass # Replace with function body.


func _on_SummerVacations_pressed():
	pass # Replace with function body.



func _on_GoBackButton_pressed():
	path = "res://TitleScreen/TitleScreen.tscn"
	$FadeIn.show()
	$FadeIn.fade_in()
	$Menu.hide()
	return path


func _on_FadeIn_fade_finished():
	get_tree().change_scene(path)



