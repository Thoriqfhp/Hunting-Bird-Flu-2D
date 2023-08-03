extends Area2D

var hp_item_timer

func _ready():
	$HP_Item_Timer.start()
#	hp_item_timer = Timer.new()
#	hp_item_timer.set_wait_time(5)
#	add_child(hp_item_timer)
#	hp_item_timer.start()
#	hp_item_timer.connect("timeout", self, "hp_item_hilang")

func hp_item_hilang():
	queue_free()
