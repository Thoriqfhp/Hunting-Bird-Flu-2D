extends Node2D

var active_image

onready var image1 = $"CanvasLayer/Control/TextureRect"
onready var image2 = $"CanvasLayer/Control/TextureRect2"

func _ready():
	active_image = image1
	active_image.rect_position.x = 0.0


func _on_LeftButton_pressed():
	if active_image != image1 and active_image != null:
		active_image = image1
		$"CanvasLayer/Control/Tween".interpolate_property(active_image, "rect_position", active_image.rect_position, Vector2(0.0, active_image.rect_position.y), 1.0, Tween.TRANS_SINE, Tween.EASE_IN)
		$"CanvasLayer/Control/Tween".interpolate_property(image2, "rect_position", image2.rect_position, Vector2(0.0 + 1280.0, image2.rect_position.y), 1.0, Tween.TRANS_SINE, Tween.EASE_IN)
#		$"CanvasLayer/Control/Tween".interpolate_property(active_image, "rect_scale", Vector2.ZERO, Vector2.ONE, 1.0, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
#		$"CanvasLayer/Control/Tween".interpolate_property(image2, "rect_scale", Vector2.ONE, Vector2.ZERO, 1.0, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
		
		$"CanvasLayer/Control/Tween".start()


func _on_RightButton_pressed():
	if active_image != image2 and active_image != null:
		active_image = image2
		$"CanvasLayer/Control/Tween".interpolate_property(active_image, "rect_position", active_image.rect_position, Vector2(0.0, active_image.rect_position.y), 1.0, Tween.TRANS_SINE, Tween.EASE_IN)
		$"CanvasLayer/Control/Tween".interpolate_property(image1, "rect_position", image1.rect_position, Vector2(0.0 - 1280.0, image1.rect_position.y), 1.0, Tween.TRANS_SINE, Tween.EASE_IN)
#		$"CanvasLayer/Control/Tween".interpolate_property(active_image, "rect_scale", Vector2.ZERO, Vector2.ONE, 1.0, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
#		$"CanvasLayer/Control/Tween".interpolate_property(image1, "rect_scale", Vector2.ONE, Vector2.ZERO, 1.0, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
		
		$"CanvasLayer/Control/Tween".start()


func _on_Back_Button_pressed():
	var err = get_tree().change_scene("res://Main_menu.tscn")
	if err != OK:
		print("Failure!")
