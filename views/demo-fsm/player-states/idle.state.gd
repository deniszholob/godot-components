class_name IdleState extends State

@export
var new_state: State

var timer: SceneTreeTimer

func _transition_check():
	if(!timer):
		timer = get_tree().create_timer(1)
		timer.timeout.connect(func():
			_change_state(new_state)
			timer = null
		)
