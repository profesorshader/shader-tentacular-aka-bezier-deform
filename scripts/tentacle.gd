extends Node3D

# updates tentacle material and gives a random offset to the animation 

@export var mat : ShaderMaterial
@export var animation_offset_range := 2.0 # use animation duration

func _ready():
	var animation_player = $AnimationPlayer
	var mesh = $tentacle
	var bezier = $tentacle/Bezier5

	# update this tentacle material (each tentacle needs its material)
	mesh.material_override = mat
	bezier.update_material()

	# play idle animation with a random offset and speed
	var offset = randf_range(0.0, animation_offset_range)
	var play_speed = randf_range(0.9, 1.1)
	animation_player.play("idle", 1.0, play_speed)
	animation_player.seek(offset, true)
		
