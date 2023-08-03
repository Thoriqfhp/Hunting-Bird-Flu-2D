extends Node2D


var Burung_Sakit = preload("res://Level/Burung_Sakit.tscn")
var Burung_Sehat = preload("res://Level/Burung_Sehat.tscn")
var Target = preload("res://Level/Target.tscn")
var HP_Item = preload("res://Level/HP_Item.tscn")
var Level = 1

var heart = load("res://assets/Health.png")
var HP_UP = load("res://assets/HealthUp_Item.png")
var empty_heart = load("res://assets/NoHealth.png")
var max_HP = 3
var HP = 3
var Score = 0
var speed_2_add = 0

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN) # hide the mouse cursor
	$Day_and_Night_Cycle_Animation.play("Day_and_Night_Cycle")
	$"Burung_Speed_Timer".start()
	update_hp(HP)
	randomize()

# warning-ignore:unused_argument
func _process(delta):
	$Target.position.x = get_local_mouse_position().x
	$Target.position.y = get_local_mouse_position().y

func set_score(score):
	Score = Score + score
	$UI/Score.text = "SCORE : " + str(Score)
	
	
func _on_SpawnTimer_Sakit_timeout():
	
	var burung1 = Burung_Sakit.instance()
	var burung2 = Burung_Sakit.instance()
	
	add_child(burung1)
	add_child(burung2)
	
	var area1 = $Spawn_Burung_Area1
	var area2 = $Spawn_Burung_Area2
	
	var position_kanan = area1.rect_position + Vector2(randf() * area1.rect_size.x, randf() * area1.rect_size.y)
	var position_kiri = area2.rect_position + Vector2(randf() * area2.rect_size.x, randf() * area2.rect_size.y)
	
	burung1.position = position_kanan
	burung1.speed = 250 + speed_2_add
	burung2.position = position_kiri
	burung2.speed = -250 - speed_2_add
	burung2.scale.x = -1
	
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

func update_hp(hp_sisa):
	if HP >= max_HP:
		HP = max_HP
	var hp_bar = get_node("UI/HP_Bar")
	for i in hp_bar.get_child_count():
		if i <= hp_sisa - 1:
			hp_bar.get_child(i).texture = heart
		if i > hp_sisa - 1:
			hp_bar.get_child(i).texture = empty_heart

func _on_Area2D_body_entered(body):
	if body.is_in_group("burung sakit"):
		HP -= 1
		if HP < 1:
			game_over(Score)
	update_hp(HP)
	body.queue_free()

func game_over(final_score):
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE) # hide the mouse cursor
	$SpawnTimer_Sakit.stop()
	$SpawnTimer_Sehat.stop()
	$SpawnHPUp_Timer.stop()
	get_tree().call_group("collision burung", "queue_free")
	get_tree().call_group("hp_item", "queue_free")
	$"UI/Game Over/MenuContent/MarginContainer2/HighScore".text = "YOUR HIGH SCORE\n" + str(final_score)
	$"UI/Game Over".visible = true
	$"UI/Game Over/AnimationPlayer".play("Fading")
	$UI/HP_Bar.visible = false
	$UI/Score.visible = false

func _on_SpawnHPUp_Timer_timeout():
	var HP_Up_item = HP_Item.instance()
	var spawn_area_hp = $Spawn_HPUp_Item
	
	HP_Up_item.position = spawn_area_hp.rect_position + Vector2(randf() * spawn_area_hp.rect_size.x, randf() * spawn_area_hp.rect_size.y)
	add_child(HP_Up_item)


func _on_Burung_Speed_Timer_timeout():
	speed_2_add += 10
	$"Burung_Speed_Timer".wait_time += 3.0
	$"Burung_Speed_Timer".start()


func _on_TimerLevel_timeout():
	if $"SpawnTimer_Sakit".wait_time <= 1.0 :
		$"TimerLevel".stop()
	$"SpawnTimer_Sakit".wait_time -= 0.1
##	var current_spawn_wait_time = $"SpawnTimer_Sakit".wait_time
#	if current_spawn_wait_time > 0:
#		if current_spawn_wait_time <= 0.1:
#			$"SpawnTimer_Sakit".wait_time = 0.1
#		else:
#			$"SpawnTimer_Sakit".wait_time -= 0.5
