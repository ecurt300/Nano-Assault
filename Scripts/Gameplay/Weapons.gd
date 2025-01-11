extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$ShootTimer.wait_time = randf()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_shoot_timer_timeout():
	$Gun.fire()
	
