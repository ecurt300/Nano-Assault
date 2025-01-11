extends Node2D
@export var health = 100
@export var health_bar : ProgressBar
signal die

func _ready():
	add_to_group("Player")
	health_bar.value = health
func _decrease_health(amount:float):
	health -= amount
	health_bar.value -=amount
	if health <= 0:
		die.emit()
	
