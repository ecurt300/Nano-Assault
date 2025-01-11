extends ParallaxBackground
const SPEED = 200
#will probably fix  this later
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_offset += Vector2.DOWN * SPEED * delta

	
	
