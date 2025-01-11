extends CharacterBody2D
@export var death_node : PackedScene
const SPEED = 600
const ACCELRATION = 800
#will clean this up soon
signal dead

func _physics_process(delta):
	
	var input_dir = Input.get_vector("MoveLeft","MoveRight","MoveUp","MoveDown")
	var direction = transform.basis_xform(input_dir).normalized()
	
	if direction.x > 0.0:
		#$AnimatedSprite2D.play_animation("TurnRight",true,true)
		Utils.play_animation(1.0,true,true,$AnimatedSprite2D,"TurnRight")
	if direction.x < 0.0:
		#$AnimatedSprite2D.play_animation("TurnLeft",true,true)
		Utils.play_animation(1.0,true,true,$AnimatedSprite2D,"TurnLeft")
	if direction:
		velocity.x =move_toward(velocity.x,direction.x* SPEED,delta * ACCELRATION)
		velocity.y =move_toward(velocity.y,direction.y * SPEED,delta* ACCELRATION)
	else:
		velocity.x = move_toward(velocity.x,0,delta * ACCELRATION)
		velocity.y = move_toward(velocity.y,0,delta * ACCELRATION)

	move_and_slide()

func _on_health_die():
	#Utils.die(self,$AnimatedSprite2D,"Explode")
	Utils.instantiate_node(death_node,position,global_transform,false)
	queue_free()
	dead.emit()
