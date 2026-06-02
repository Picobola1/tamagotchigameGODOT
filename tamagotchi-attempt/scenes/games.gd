extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	Main.Happy += 2
	Main.makeWindow("score: " + str(Main.SnakeScore),"res://scenes/snake.tscn", Vector2(1000,1000), Vector2(500,500) )
