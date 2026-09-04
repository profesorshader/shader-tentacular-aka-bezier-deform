@tool
extends EditorPlugin

const GIZMO_SCRIPT: GDScript = preload("bezier5_gizmo.gd")
const MAIN_SCRIPT: GDScript = preload("bezier5.gd")
const ICON: Texture2D = preload("icon.svg")

var _gizmo_plugin: EditorNode3DGizmoPlugin = GIZMO_SCRIPT.new()

func _enter_tree() -> void:
	add_custom_type("Bezier5", "MeshInstance3D", MAIN_SCRIPT, ICON)
	add_node_3d_gizmo_plugin(_gizmo_plugin)

func _exit_tree() -> void:
	remove_node_3d_gizmo_plugin(_gizmo_plugin)
	remove_custom_type("Bezier5")
