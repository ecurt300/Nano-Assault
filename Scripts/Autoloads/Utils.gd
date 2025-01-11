extends Node


func play_animation(animation_speed:float,is_one_shot:bool,is_reverse: bool,animator:AnimatedSprite2D,animation_name:String):
	var animation_complete = 1

	if is_one_shot and animator.frame_progress >= animation_complete:
		animation_speed = 0.0
	else:
		animation_speed = animation_speed
		animator.stop()
	if !animator.is_playing():
		if is_reverse:
			animator.play_backwards(animation_name)
		else:
			animator.play(animation_name)


func play_sound(sound_pitch:float,sound_volume:float,is_one_shot:bool,audio_player:AudioStreamPlayer2D):
	audio_player.pitch_scale = sound_pitch
	audio_player.volume_db = sound_volume
	
	if !audio_player.playing:
		audio_player.play()
	elif audio_player.finished:
		audio_player.stop()

func move_in_relative_direction_by_speed(body:Area2D,speed: float,transform: Transform2D,direction: Vector2):
	var move_direction = transform.basis_xform(direction).normalized()
	var velocity = move_direction * speed
	var body_transform = transform.translated(velocity)
	body.transform = body_transform

#func die(node:CharacterBody2D,animator:AnimatedSprite2D,animation:String):
#	var speed = 1.0
#	var one_shot = true	
#	
#	play_animation(speed,one_shot,true,animator,animation)
#	if animator.is_playing():
#		node.queue_free()

func instantiate_node(node:PackedScene,target_position:Vector2,relative_transform:Transform2D,is_relative: bool):
	var node_instance = node.instantiate()
	
	if is_relative:
		node_instance.transform = relative_transform
	else:
		node_instance.position = target_position
	
	if node_instance:
		get_tree().root.add_child(node_instance)
	
func spawn_on_path2D(node:PackedScene,spawn_path:PathFollow2D):
	var spawn_pos = spawn_path
	spawn_path.progress_ratio = randf()
	
	Utils.instantiate_node(node,spawn_path.global_position,spawn_pos.transform,false)
