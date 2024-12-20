# Makes a raycast point to object_to_track
# TODO make the object_to_track and export? and make this a raycast?
class_name NodeTrackerComponent extends Node2D

@export var ray_cast_2d: RayCast2D
@export var sight_range: int = 100

var object_to_track: Node2D

var look_direction: Vector2 = Vector2.RIGHT
var is_colliding: bool = false
var distance_to_target: int = 0

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if(object_to_track):
		look_direction = (object_to_track.position - global_position).normalized()
		ray_cast_2d.target_position = look_direction * sight_range
