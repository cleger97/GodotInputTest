extends Control

signal input1
signal input2
# Declare member variables here.
var setupControllers = false

var devices = [-1, -1]
var currentDevice = -1;

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.connect("joy_connection_changed", self, "c_change")
	setupControls()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# var data = Input.get_connected_joypads();
	# print(data);
	return
	
func _input(event):
	if (!setupControllers):
		return
		
	#print(event)
	
	if (event is InputEventJoypadButton):
		if (event.button_index == JOY_START && event.pressed):
			print(Input.get_joy_guid(event.device))
			print(Input.is_joy_known(event.device))
			
			if (devices[0] == -1):
				devices[0] = event.device
				initInputs(event.device)
				emit_signal("input1")
			elif (devices[1] == -1 && event.device != devices[0]):
				devices[1] = event.device
				emit_signal("input2")
			elif (event.device == devices[0]):
				print("Same Controller")
			else:
				print("Error: Should not be assigning more than 2 controls")
		
		#print(event.button_index)
	return
	
func initInputs(device):
	# General idea: Just pre-create everything and reassign device values
	#InputMap.add_action("p" + str(device) + "_light", 0);	
	InputMap.add_action("p" + str(device) + "_heavy", 0);
	InputMap.add_action("p" + str(device) + "_down", 0);	
	InputMap.add_action("p" + str(device) + "_up", 0);	
	InputMap.add_action("p" + str(device) + "_left", 0);	
	InputMap.add_action("p" + str(device) + "_right", 0);	
	
	print(InputMap.get_actions())
	
func c_change(device, connected):
	print(device, " ", connected);
	pass
	
func setupControls():
	setupControllers = true
	
	print("Press start button on 1st controller to continue")
	yield(self, "input1")
	
	print("Press start button on 2nd controller to continue:")
	yield(self, "input2")
	
	setupControllers = false;
	
	pass