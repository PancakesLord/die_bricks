extends ColorRect

signal animation_finished

func fade_out():
	$AnimationPlayer.play("FadeOut")

func _on_AnimationPlayer_animation_finished(anim_name):
	emit_signal("animation_finished")


