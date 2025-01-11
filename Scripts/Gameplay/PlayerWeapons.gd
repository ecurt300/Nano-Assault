extends Node2D
@export var Blaster : Node2D

func _process(delta):
	if(Input.is_action_pressed("Fire")):	
		Blaster.fire()
