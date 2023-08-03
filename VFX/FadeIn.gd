extends ColorRect

signal fade_in_finish

func playing():
	$AnimationPlayer.play("fade_in")


#warning-ignore:unused_argument
func _on_AnimationPlayer_animation_finished(anim_name):
	emit_signal("fade_in_finish")
