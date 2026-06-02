extends AnimatedSprite2D

var NewWindow = Window.new()
var Happy = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	makeWindow("Food", "res://scenes/food.tscn", Vector2i(175,250), Vector2i(10,10))
	makeWindow("Happiness", "res://scenes/happy_level.tscn", Vector2i(450,50), Vector2i(1300,620))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func makeWindow(title: String,scene: String,size: Vector2i, position: Vector2i):
	var window = Window.new()
	add_child(window)
	window.title = title
	window.position = position
	window.visible = true
	window.size = size
	window.unresizable = true
	window.maximize_disabled = true
	window.minimize_disabled = true
	# pre load dosent accept vars so we load it imdetly instead
	var loaded_scene = load(scene)
	var scene_instance = loaded_scene.instantiate()
	window.add_child(scene_instance)
	
