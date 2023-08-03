extends Node

func _ready():
	#warning-ignore:return_value_discarded
#	$"FadeIn".connect("fade_in_finish", self, "fade_finished")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func fade_finished():
	var err = get_tree().change_scene("res://Level/Game.tscn")
	if err != OK:
		print("Failure!")

func _on_StartGame_pressed():
	$AnimationPlayer.play("Fade_In")
	yield($AnimationPlayer, "animation_finished")
	fade_finished()
#	$FadeIn.show()
#	$FadeIn.playing()
#	var err = get_tree().change_scene("res://Level/Game.tscn")
#	if err != OK:
#		print("Failure!")

func _on_HowToPlay_pressed():
	var err = get_tree().change_scene("res://How_to_play.tscn")
	if err != OK:
		print("Failure!")
	
func _on_ExitGame_pressed():
	get_tree().quit()



