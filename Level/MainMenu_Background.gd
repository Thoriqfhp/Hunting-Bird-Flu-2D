extends Node2D

var Burung_Sehat = preload("res://Level/Burung_Sehat.tscn")

func _on_SpawnTimer_Sehat_timeout():
	var burung3 = Burung_Sehat.instance()
	var burung4 = Burung_Sehat.instance()
	
	add_child(burung3)
	add_child(burung4)
	
	var area1 = $Spawn_Burung_Area1
	var area2 = $Spawn_Burung_Area2
	
	var position_kanan = area1.rect_position + Vector2(randf() * area1.rect_size.x, randf() * area1.rect_size.y)
	var position_kiri = area2.rect_position + Vector2(randf() * area2.rect_size.x, randf() * area2.rect_size.y)
	
	burung3.position = position_kanan
	burung3.speed = 120
	burung4.position = position_kiri
	burung4.speed = -120
	burung4.scale.x = -1


func _on_Area2D_body_entered(body):
	body.queue_free()
