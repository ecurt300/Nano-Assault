extends Node2D

@export var fire_rate = 1.0
@export var cooldown_time =0.5
@export var projectile : PackedScene
var cooldown = false

func _ready():
	var fire_timer = Timer.new()
	fire_timer.name = "fire_timer"
	fire_timer.wait_time = 1
	fire_timer.one_shot = true
	add_child(fire_timer)
	fire_timer.timeout.connect(_on_fire_timer_timeout)

func spawn_projectile():
	Utils.instantiate_node(projectile,position,global_transform,true)
func fire():
	if not cooldown:
		spawn_projectile()
		start_cooldown()
				
func start_cooldown():
	cooldown = true
	$fire_timer.start(cooldown_time)
	
func _on_fire_timer_timeout():
		cooldown = false
