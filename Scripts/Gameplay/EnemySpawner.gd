extends Path2D

@export var enemy : PackedScene

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawn_timer_timeout():
	var enemy_spawner_location = $EnemySpawnerLocation
	Utils.spawn_on_path2D(enemy,enemy_spawner_location)
