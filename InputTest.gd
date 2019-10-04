extends Control
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.connect("joy_connection_changed", self, "c_change")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# var data = Input.get_connected_joypads();
	# print(data);
	return
	
func _input(event):
	if (event is InputEventJoypadButton):
		print(event.device, " pressed something.")
	return
	
	
func c_change(device, connected):
	print(device, " ", connected);
	pass
	
