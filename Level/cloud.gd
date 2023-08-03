extends ParallaxLayer


export var speed = -20.0


func _process(delta):
	self.motion_offset.x += speed * delta
