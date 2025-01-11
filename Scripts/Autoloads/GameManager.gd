extends Node
enum GameStates {Lose,Win,Play} 
var game_state : GameStates
func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	game_state = GameStates.Play
func lose_game(panel:Panel):
	panel.show()
	get_tree().paused = true
	game_state = GameStates.Lose

func toggle_paused(panel:Panel):
	if game_state == GameStates.Play:
		if(get_tree().paused):
			get_tree().paused= false
			panel.hide()
		elif(!get_tree().paused):
			get_tree().paused = true
			panel.show()

func pause_game(panel:Panel):
	if(!get_tree().paused):
		get_tree().paused = true
		panel.show()
func un_pause_game(panel:Panel):
	if(get_tree().paused):
		get_tree().paused= false
		panel.hide()
		
		
func quite_game():
	get_tree().quit()
func change_scene():
	pass
