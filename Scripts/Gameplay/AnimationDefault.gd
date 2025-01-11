extends AnimatedSprite2D
var pulse_out: bool
var has_spawned : bool
var spawned_obstacle : Node2D
@export var obstacle : PackedScene


func spawn_process():
	var rng = randf()
	$Timer.wait_time = rng

# Called when the node enters the scene tree for the first time.
func _ready():
	play("default")
	add_to_group("Blood")
func _process(delta):
	if pulse_out:
		play("default")
	has_spawned = !spawned_obstacle
		
	#animation_speed:float,is_one_shot:bool,is_reverse: bool,animator:AnimatedSprite2D,animation_name:String
func stop_pulse():
	if pulse_out:
		pulse_out= false
		
	


func _on_animation_finished():
	pulse_out = true
	stop()


func _on_timer_timeout():
	if has_spawned:
		var node_instance = obstacle.instantiate()
		if node_instance:
			node_instance.position = global_position
			get_tree().root.add_child(node_instance)
			spawned_obstacle = node_instance
