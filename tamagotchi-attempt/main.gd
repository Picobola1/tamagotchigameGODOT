extends AnimatedSprite2D

var NewWindow = Window.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var NewWindow = Window.new()
	add_child(NewWindow)
	NewWindow.title = "FOOD"
	NewWindow.position = Vector2i(100,100)
	NewWindow.visible = true
	NewWindow.size = Vector2i(128,128)
	
	var second_scene = preload("res://scenes/food.tscn").instantiate()
	NewWindow.add_child(second_scene)
