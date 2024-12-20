@tool
class_name TransparencyZoneArea extends Area2D
const WARN_REQ_actor: String = "Missing Actor Node, will be set to parent by default"

# Node to apply direction to
@export
var actor: Node2D:
	set(v):
		actor = v
		if(Engine.is_editor_hint()): update_configuration_warnings()

@export
var player_layer:= 0b0010 # layer 2 default

var MOD_COLOR_DEFAULT: Color = Color.from_hsv(0, 0, 1, 1)
var MOD_COLOR_TRANSPARENT: Color = Color.from_hsv(0, 0, 1, .5)

# Shows warnings in editor
func _get_configuration_warnings() -> PackedStringArray:
	var warnings:= PackedStringArray()
	if(!actor): warnings.append(WARN_REQ_actor)
	return warnings

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if(!actor): actor = get_parent() # Auto get parent node as the actor
	collision_layer = 0b0000 # No need to be detected by other things, change if thats not true
	collision_mask = player_layer # Detect only player (default on layer 2)
	body_entered.connect(on_body_entered)
	body_exited.connect(on_body_exited)

func on_body_entered(_body: Node2D) -> void:
	create_tween().tween_property(actor, "modulate", MOD_COLOR_TRANSPARENT, 0.2)
	#actor.modulate = MOD_COLOR_TRANSPARENT

func on_body_exited(_body: Node2D) -> void:
	create_tween().tween_property(actor, "modulate", MOD_COLOR_DEFAULT, 0.2)
	#actor.modulate = MOD_COLOR_DEFAULT
