extends KinematicBody2D

var speed = 1

func _ready():
	randomize()

func _process(delta):
	position.x -= speed*delta
	
	if position.y < 16.0:
		position.y = lerp(position.y, position.y + 16.0, 0.02)
	if position.y > 704.0:
		position.y = lerp(position.y, position.y - 16.0, 0.02)

func mati(jenisburung):
	if jenisburung.is_in_group("burung sakit"):
		get_parent().set_score(1)
	if jenisburung.is_in_group("burung sehat") and get_parent().Score > 0:
		get_parent().set_score(-1)
	$AnimatedSprite.animation = "mati"
	$CollisionShape2D.set_deferred("set_disabled", true)
#	$CollisionShape2D.set_disabled(true)
	yield(get_tree().create_timer(0.1), "timeout")
	call_deferred("queue_free")


func _on_Timer_timeout():
	var rand_pos_y = rand_range(80.0, 100.0)
	var rand_plus_minus = [-rand_pos_y, rand_pos_y]
#	print(rand_pos_y)
#	set_process(false)
	$Tween.interpolate_property(self, "position", Vector2(position.x, position.y), Vector2(position.x - speed, position.y + rand_plus_minus[randi() % 2]), 0.7, Tween.TRANS_LINEAR)
	$Tween.start()
	
#	yield(get_tree().create_timer(1.0), "timeout")
#	set_process(true)
