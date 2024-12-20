# Sends out a signal with the input direction that can be used elsewhere
class_name InputDeviceDirectionComponent extends Node

signal direction_vector_update(direction_vector: Vector2)

var direction_vector: Vector2 = Vector2.ZERO:
	set(d):
		direction_vector = d
		direction_vector_update.emit(d)

func _process(_delta: float) -> void:
	# direction_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	direction_vector = Input.get_vector("move_left", "move_right", "move_up", "move_down")
