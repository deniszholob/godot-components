# Raycast node with on_direction_vector_update function to use to update its rotation
# Use it like a regular raycast
class_name InteractDetectionRayComponent extends RayCast2D

enum DIRECTION { DOWN, LEFT, UP, RIGHT }
const DIRECTION_TO_VECTOR_DIC = {
	DIRECTION.DOWN: Vector2.DOWN,
	DIRECTION.LEFT: Vector2.LEFT,
	DIRECTION.UP: Vector2.UP,
	DIRECTION.RIGHT: Vector2.RIGHT,
}
const FULL_CIRCLE_ANGLE: float = 2 * PI # 360 in radians

@export var inital_direction: DIRECTION = DIRECTION.DOWN:
	set(v): _initial_direction = DIRECTION_TO_VECTOR_DIC[v]


var direction_vector: Vector2 = Vector2.ZERO:
	set(d):
		direction_vector = d
		if(direction_vector.length()):
			rotation = FULL_CIRCLE_ANGLE - direction_vector.angle_to(_initial_direction)


var _initial_direction: Vector2 = Vector2.DOWN


# Connect via signal or update from seperate script
func on_direction_vector_update(_direction: Vector2) -> void:
	direction_vector = _direction
