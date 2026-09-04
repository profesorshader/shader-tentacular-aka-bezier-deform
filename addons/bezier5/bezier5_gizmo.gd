@tool
extends EditorNode3DGizmoPlugin

func _get_gizmo_name() -> String:
	return "Bezier5"

func _has_gizmo(spatial: Node3D) -> bool:
	return spatial is Bezier5	

func _init() -> void:
	create_material("main", Color.YELLOW, false)

func _redraw(gizmo):
	gizmo.clear()

	var node3d = gizmo.get_node_3d()

	# get parent knots
	var knots: Array[Node] = node3d.get_parent().find_children("*", "Marker3D", true, false)
	if knots.size() != 5:
		return	
	
	# draw lines between children nodes
	var lines = PackedVector3Array()
	for i in range(4):  # 4 iterations = 4 lines
		var from_node = knots[i] as Node3D
		var to_node = knots[i + 1] as Node3D

		lines.push_back(from_node.position)
		lines.push_back(to_node.position)

	gizmo.add_lines(lines, get_material("main", gizmo), false)
