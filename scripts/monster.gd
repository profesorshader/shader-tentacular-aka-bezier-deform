extends Node3D

# moves the monster (Y axis) using a sine wave

@export var amplitude: float = 1.0
@export var speed: float = 1.0

var start_y: float

func _ready():
	start_y = position.y

func _process(_delta):
	position.y = start_y + sin(Time.get_ticks_msec() / 1000.0 * speed) * amplitude
