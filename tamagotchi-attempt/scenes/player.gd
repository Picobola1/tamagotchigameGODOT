extends Node2D

@onready var hungryL: Label = $Hungry
@onready var playL: Label = $Play
@onready var sickL: Label = $Sick

var hunrgy := 0
var play := 1
var sick := 2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var random = randi_range(0,2)
	hungryL.visible = false
	playL.visible = false
	sickL.visible = false
	if random == 0:
		hungryL.visible = true
		playL.visible = false
		sickL.visible = false
	if random == 1:
		playL.visible = true
		sickL.visible = false
		hungryL.visible = false
	if random == 2:
		sickL.visible = true
		playL.visible = false
		hungryL.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
