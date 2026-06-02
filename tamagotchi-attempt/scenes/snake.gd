extends Node2D

@export var snake_scene : PackedScene
var score : int = Main.SnakeScore
var game_start = false


#snake vars
var old_data : Array
var snake_data : Array
var snake : Array
var cells : int = 20
var cellSize : int = 50
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
	add_child(SnakeSegment)
	SnakeSegment.position = (pos * cellSize) + Vector2(0,cellSize)
	
	snake.append(SnakeSegment)
	print("START POS IS: ", start_pos)
	print("grid pos: ", pos)
	print("local screen pos: ", SnakeSegment.position)
	print("global screen pos: ", SnakeSegment.global_position)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_snake()
func move_snake():
	if can_move:
		if Input.is_action_just_pressed("down") and move_direction != up:
			move_direction = down
			can_move = false
			if not game_start:
				start_game()
		if Input.is_action_just_pressed("up") and move_direction != down:
			move_direction = up
			can_move = false
			if not game_start:
				start_game()
		if Input.is_action_just_pressed("left") and move_direction != right:
			move_direction = left
			can_move = false
			if not game_start:
				start_game()
		if Input.is_action_just_pressed("right") and move_direction != left:
			move_direction = right
			can_move = false
			if not game_start:
				start_game()

func start_game():
	game_start = true
	$MoveTimer.start()
			

func _on_move_timer_timeout() -> void:
	
	can_move = true

	old_data = [] + snake_data

	snake_data[0] += move_direction

	for i in range(len(snake_data)):
		if i > 0:
			snake_data[i] = old_data[i - 1]

		snake[i].position = (snake_data[i] * cellSize) + Vector2(0, cellSize)
	 
