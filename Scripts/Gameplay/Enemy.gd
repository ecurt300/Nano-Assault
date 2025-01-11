extends Area2D

const SPEED = 0.3
@export var death_node : PackedScene
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	add_to_group("Enemies")

func _process(delta):
	Utils.move_in_relative_direction_by_speed(self,SPEED,transform,Vector2.DOWN)
	
func _on_area_entered(area):
	if area.is_in_group("Bullets"):
		Utils.instantiate_node(death_node,position,transform,false)
		queue_free()
