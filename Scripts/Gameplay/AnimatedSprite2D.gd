extends AnimatedSprite2D


func play_animation(_name,reverse,one_shot):
	if one_shot and frame_progress >= 1:
		speed_scale = 0.0
	else:
		speed_scale = 1.0
		stop_animation()
	if !is_playing():
		if reverse:
			play_backwards(_name)
		else:
			play(_name)
func stop_animation():
	stop()
	
