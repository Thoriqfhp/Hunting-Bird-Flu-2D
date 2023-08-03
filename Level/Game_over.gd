extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _on_TryAgain_pressed():
	var err = get_tree().change_scene("res://Level/Game.tscn")
	if err != OK:
		print("Failure!")

func _on_QuitMenu_pressed():
	var err = get_tree().change_scene("res://Main_menu.tscn")
	if err != OK:
		print("Failure!")
