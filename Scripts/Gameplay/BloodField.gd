extends Path2D

@export var rbc: PackedScene	

func spawn_rbc():
	var rbc_spawn_location = $SpawnPoint
	#rbc_spawn_location.progress_ratio = randf()
	#node:PackedScene,target_position:Vector2,relative_transform:Transform2D,is_relative: bool
	Utils.spawn_on_path2D(rbc,rbc_spawn_location)

func _on_timer_timeout():
	spawn_rbc()
