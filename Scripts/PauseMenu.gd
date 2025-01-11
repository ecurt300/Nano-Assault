extends Panel



func _process(delta):
	if Input.is_action_just_pressed("Escape"):
		GameManager.toggle_paused(self)


func _on_unpause_pressed():
		GameManager.toggle_paused(self)
