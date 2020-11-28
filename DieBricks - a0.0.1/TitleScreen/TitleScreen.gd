extends Control

var path = " "
#onready var settingsmenu = load("res://OptionsMenu/OptionsMenu.tscn")

func _ready():
	$FadeIn.hide()
	$Menu/CenterRow/Buttons/LevelSelect.grab_focus()


func _on_LevelSelect_pressed():
	path = "res://Level/LevelSelect.tscn"
	$FadeIn.show()
	$FadeIn.fade_in()
	$Menu.hide()
	return path


func _on_Options_pressed():
	#add_child(settingsmenu.instance())
	#get_tree().paused = not get_tree().paused
	pass


func _on_Quit_pressed():
	get_tree().quit()


func _on_FadeIn_fade_finished():
	get_tree().change_scene(path)
