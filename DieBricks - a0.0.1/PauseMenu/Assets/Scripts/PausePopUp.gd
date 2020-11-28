extends Popup

var path = " "
var ball_scene = preload("res://mini scenes/Ball_scenes.tscn")


func _ready():
	$Menu/CenterRow/Buttons/UnpauseButton.grab_focus()

func _input(event):
	if event.is_action_pressed('pause'):
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state
		visible = new_pause_state


func _on_UnpauseButton_pressed():
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state


func _on_RetryButton_pressed():
	get_tree().call_group("Balls", "queue_free")
	$".".hide()
	get_tree().paused = false
	get_tree().reload_current_scene()



func _on_GoBackButton_pressed():
	path = "res://TitleScreen/TitleScreen.tscn"
	get_tree().call_group("Balls", "queue_free")
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	get_tree().change_scene(path)


func _on_FadeIn_fade_finished():
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	get_tree().change_scene(path)
