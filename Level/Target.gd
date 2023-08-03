extends Area2D

#var hitburung
onready var fire_rate = $Fire_Rate

func _ready():
	fire_rate.one_shot = true
	fire_rate.wait_time = 0.5
	pass

func _on_Target_body_entered(body):
	var hitburung = body
	if hitburung == null:
		print("Burung tidak kena")
	else:
		hitburung.mati(hitburung)

func _input(_event):
	if Input.is_action_just_pressed("Shoot") and fire_rate.is_stopped():
		fire_rate.start()
		$AudioStreamPlayer2D.play()
		$CollisionShape2D.disabled = false # collision enable:
		yield(get_tree().create_timer(0.05),"timeout")
		$CollisionShape2D.disabled = true #disable collision
#	if Input.is_action_just_released("Shoot"):
#		$CollisionShape2D.disabled = true #disable collision
#		if hitburung == null:
#			print("Burung tidak kena")
#		else:
#			hitburung.mati()
			


#func _on_Target_body_shape_exited(body_id, body, body_shape, local_shape):
#	print("1 : " + str((body.name)))
#	print("2 : " + str(hitburung.name))
#	$CollisionShape2D.disabled = true


func _on_Target_area_entered(area):
	if area.is_in_group("hp_item"):
		get_parent().HP += 1
		get_parent().update_hp(get_parent().HP)
		area.queue_free()
