@tool
class_name Bezier5
extends Node3D

var _material : ShaderMaterial
var _knots: Array[Node]

func _ready() -> void:
	# this node should be children of the MeshInstance3D	
	if not get_parent() is MeshInstance3D:
		push_warning("Parent should be a MeshInstance3D")
		return

	# get knots
	_knots = get_parent().find_children("*", "Marker3D", true, false)
	if _knots.size() != 5:	
		push_warning("Parent should have 5 Marker3D child nodes")
		return

	# process mode on!
	set_process(true)

	# get override material from the parent node
	update_material()

func _process(_delta: float) -> void:
	# has (parent override) material?
	if _material == null:
		return	

	# update knot position in the shader/material
	_material.set_shader_parameter("bez0", _knots[0].position)
	_material.set_shader_parameter("bez1", _knots[1].position)
	_material.set_shader_parameter("bez2", _knots[2].position)
	_material.set_shader_parameter("bez3", _knots[3].position)
	_material.set_shader_parameter("bez4", _knots[4].position)

func update_material() -> bool:
	var matl = get_parent().material_override
	if not matl is ShaderMaterial:
		push_warning("Invalid parent override material")
		return false
	_material = matl
	return true
