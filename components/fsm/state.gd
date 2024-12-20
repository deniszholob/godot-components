# Abstract Class
# Usage: class_name IdleState extends State
class_name State extends Node

signal transition_state(state: State)

var debug_label: Label

# Call in FSM to pass data to State children
func fsm_init(label: Label) -> void:
	if(!debug_label and label):
		debug_label = label

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED
	#set_physics_process(false)

# If overriding, add super._physics_process(delta)
func _physics_process(_delta: float) -> void:
	_transition_check()

# If overriding, add super.enter()
func enter() -> void:
	if(debug_label): debug_label.text = name
	process_mode = Node.PROCESS_MODE_INHERIT
	#set_physics_process(true)

# If overriding, add super.exit()
func exit() -> void:
	if(debug_label): debug_label.text = '_____'
	process_mode = Node.PROCESS_MODE_DISABLED
	#set_physics_process(false)

# Overridable condition function to hop from one state to another
func _transition_check() -> void:
	pass

# Call in transition_check()
func _change_state(state: State) -> void:
	transition_state.emit(state)
