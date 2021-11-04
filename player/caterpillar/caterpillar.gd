class_name caterpillar
var body
var direction:Vector2
const width = 40
var body_copy

func _init():
	body = [Vector2(width,0), Vector2(0,0)]
	direction = Vector2(width, 0)

func move():
	body_copy = body.slice(0,body.size() - 2)
	var new_head = body_copy[0] + direction
	body_copy.insert(0,new_head)
	body = body_copy
