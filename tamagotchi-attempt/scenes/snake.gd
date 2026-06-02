extends Node2D

@export var snake_scene : PackedScene
var score : int = Main.SnakeScore
var game_start = false

var cells : int = 20
var cellSize : int = 50

#snake vars
var old_data : Array
var snake_data : Array
var snake : Array

var start_pos = Vector2(9,9)
var up = Vector2(0, -1)
var down = Vector2(0,1)
var left = Vector2(-1,0)
var right = Vector2(1,0)
var move_direction : Vector2
var can_move : bool 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game()

func new_game():
	Main.SnakeScore = 0
	move_direction = up
	can_move = true
	genarate_snake()
func genarate_snake():
	old_data.clear()
	snake_data.clear()
	snake.clear()
	for i in range(3):
		add_segment(start_pos + Vector2(0,i))
func add_segment(pos):
	print("making snake at ", pos)
	snake_data.append(pos)
	var SnakeSegment = snake_scene.instantiate()
	SnakeSegment.position = pos * cellSize
	add_child(SnakeSegment)
	snake.append(SnakeSegment)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
