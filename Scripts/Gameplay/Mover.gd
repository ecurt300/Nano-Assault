extends Node2D
const SPEED = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		position += Vector2.DOWN * SPEED * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
