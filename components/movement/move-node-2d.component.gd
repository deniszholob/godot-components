@tool
# Applies translate() on a Node2D, based on direction and speed
class_name MoveNode2D extends Node
const WARN_REQ_actor: String = "Missing Actor Node, will be set to parent by default"

# Node to apply movement to
@export
var actor: Node2D:
	set(v):
		actor = v
		if(Engine.is_editor_hint()): update_configuration_warnings()

# Set in editor for constant direction, or reference to change dynamically
@export
var direction_vector: Vector2 = Vector2.ZERO

# Set in editor for constant speed, or reference to change dynamically
@export
var speed: int = 100

@export
var use_rotation: bool = true

# Shows warnings in editor
func _get_configuration_warnings() -> PackedStringArray:
	var warnings:= PackedStringArray()
	if(!actor): warnings.append(WARN_REQ_actor)
	return warnings

func _ready() -> void:
	# Auto get parent node as the actor
	if(!actor): actor = get_parent()

func _physics_process(delta: float) -> void:
	if(Engine.is_editor_hint()): return;

	var normal_direction: Vector2 = direction_vector.normalized()
	var final_direction: Vector2 = normal_direction
	if(use_rotation): final_direction = normal_direction.rotated(actor.rotation)

	var velocity: Vector2 = final_direction * speed
	#actor.position += velocity * delta
	actor.translate(velocity * delta)

# Connect via signal or update from seperate script
func on_direction_vector_update(_direction: Vector2) -> void:
	direction_vector = _direction
