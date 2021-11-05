extends Node
var caterpillar
var window_border

# Called when the node enters the scene tree for the first time.
func _ready():
	window_border = OS.get_real_window_size()
	var classLoad = load("res://player/caterpillar/caterpillar.gd")
	caterpillar = classLoad.new(5)


func draw_caterpillar():
	if (caterpillar.body.size() > $caterpillar.get_child_count()):
		var lastChilde = $caterpillar.get_child($caterpillar.get_child_count()-1).duplicate()
		lastChilde.name = "body " + str($caterpillar.get_child_count())
		$caterpillar.add_child(lastChilde)
	if (caterpillar.direction != Vector2(0,0)):
		for index in range(0,caterpillar.body.size()):
			$caterpillar.get_child(index).rect_position = caterpillar.body[index]

func _input(_event):
	var moveIncrement = caterpillar.width;

	if Input.is_action_pressed("ui_right") and not caterpillar.direction == Vector2(-caterpillar.width,0):
		caterpillar.direction = Vector2(moveIncrement,0)
	elif Input.is_action_pressed("ui_left")and not caterpillar.direction == Vector2(caterpillar.width,0):
		caterpillar.direction = Vector2(-moveIncrement,0)
	elif Input.is_action_pressed("ui_down") and not caterpillar.direction == Vector2(0,-caterpillar.width):
		caterpillar.direction = Vector2(0,moveIncrement)
	elif Input.is_action_pressed("ui_up")and not caterpillar.direction == Vector2(0,caterpillar.width):
		caterpillar.direction = Vector2(0,-moveIncrement)
	else:
		caterpillar.direction = Vector2(0,0)

func _on_Timer_timeout():
	caterpillar.move()
	draw_caterpillar()
