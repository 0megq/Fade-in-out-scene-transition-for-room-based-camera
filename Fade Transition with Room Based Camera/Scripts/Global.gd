extends Node

# Singleton which stores references to other Nodes

onready var player_camera := get_tree().current_scene.get_node("PlayerCamera")
onready var platforming_player := get_tree().current_scene.get_node("PlatformingPlayer")

export var room_pause: bool = false
export var room_pause_time: float = 0.2

enum {
	UP
	RIGHT
	DOWN
	LEFT
}

func _ready() -> void:
	yield(get_tree().create_timer(0.1),"timeout")
	$SceneTransition/AnimationPlayer.play("RESET")

func change_room(room_position: Vector2, room_size: Vector2) -> void:
	player_camera.current_room_center = room_position
	player_camera.current_room_size = room_size


	$SceneTransition/AnimationPlayer.play("fade out")
	yield(get_tree().create_timer(room_pause_time),"timeout")
	if $SceneTransition/AnimationPlayer.assigned_animation == "fade out":
		$SceneTransition/AnimationPlayer.play("fade in")

