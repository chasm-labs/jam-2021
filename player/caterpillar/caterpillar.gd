class_name caterpillar
var body = []
var direction:Vector2
const width = 40
var body_copy

func _init(numSegments):
	for currSegment in range(0, numSegments):
		body.insert(currSegment, Vector2(width * currSegment, 0))
	direction = Vector2(0, 0)

func move():
    # Update the body's position while we're still moving in a direction
	if (direction != Vector2(0, 0)):
		# Retrieve just the body of the caterpillar, -2 to account for the head and regular 0-based array offset
		body_copy = body.slice(0,body.size() - 2)
		# Update the head's direction
		var new_head = body_copy[0] + direction
		# Insert the new head at the start of the body
		body_copy.insert(0,new_head)
		# Update the body of the class
		body = body_copy
