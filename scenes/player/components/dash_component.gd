extends Node3D
class_name DashComponent

@export var player: CharacterBody3D
@onready var raycast: RayCast3D = $RayCast3D

func _physics_process(delta: float) -> void:
	print(raycast.get_collider())

func _input(event: InputEvent) -> void:
	if event.is_action("dash"):
		_can_dash()

func _can_dash():
	# Check if the player is looking at something they can dash to. 
	if raycast.is_colliding():
		var node: Node3D = raycast.get_collider()
		if node.is_in_group("dash_target"):
			_dash(node)
			
func _dash(dash_target: Node3D):
	player.position = dash_target.position
