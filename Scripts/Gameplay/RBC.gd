extends Area2D

const SPEED = 60
var delta: float
var dt
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Blood")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	delta = delta
func pulse():
	Utils.move_in_relative_direction_by_speed(self,SPEED,transform,Vector2.DOWN)
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_pulse_timer_timeout():
	Utils.move_in_relative_direction_by_speed(self,SPEED * 0.1,transform,Vector2.UP)
