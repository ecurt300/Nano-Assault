extends Area2D
const SPEED = 3
const DAMAGE = 3.5
var parent_speed : Vector2
@export var group_name : String

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Bullets")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Utils.move_in_relative_direction_by_speed(self,SPEED,global_transform,Vector2.UP)
	




func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()	


func _on_area_entered(area):
	if area.is_in_group(group_name) :
		get_tree().call_group(group_name,"_decrease_health",DAMAGE)
		queue_free()
