# Should and only should have State nodes as children
class_name FSM extends Node

@export
var debug_label: Label

var current_state: State

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child: State in get_children():
		child.fsm_init(debug_label)
	var starting_state: State = get_child(0) as State
	change_state(starting_state)


# Change to the new state by first calling any exit logic on the current state.
func change_state(new_state: State) -> void:
	var current_state_name = '_____'
	if(current_state): current_state_name = current_state.name
	print("change_state: ", current_state_name, " => ", new_state.name)

	_exit_state(current_state)
	current_state = new_state
	_enter_state(current_state)

func _exit_state(state: State) -> void:
	if state:
		if(state.transition_state.is_connected(change_state)):
			state.transition_state.disconnect(change_state)
		state.exit()

func _enter_state(state: State) -> void:
	state.enter()
	state.transition_state.connect(change_state)
