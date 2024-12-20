@tool
# Spawns PackedScenes, use the spawn function to trigger spawn
class_name SpawnerComponent extends Node2D
const WARN_REQ_scene: String = "Missing Scene"

# The scene we want to spawn
@export var scene: PackedScene:
	set(v):
		scene = v
		if(Engine.is_editor_hint()): update_configuration_warnings()

# Shows warnings in editor
func _get_configuration_warnings() -> PackedStringArray:
	var warnings:= PackedStringArray()
	if(!scene): warnings.append(WARN_REQ_scene)
	return warnings

# Spawn an instance of the scene at a specific global position on a parent
# By default the parent is the current "main" scene , but you can pass in
# an alternative parent if you so choose.
func spawn(global_spawn_position: Vector2 = global_position, parent: Node = get_tree().current_scene) -> Node:
	#if(Engine.is_editor_hint()): return;
	assert(scene is PackedScene, "Error: The scene export was never set on this spawner component.")
	# Instance the scene
	var instance: Node = scene.instantiate()
	# Add it as a child of the parent
	parent.add_child(instance)
	# Update the global position of the instance.
	# (This must be done after adding it as a child)
	instance.global_position = global_spawn_position
	# Return the instance in case we want to perform any other operations
	# on it after instancing it.
	return instance
