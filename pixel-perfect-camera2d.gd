extends Camera2D

@export_category("Follow Character")
@export var player: CharacterBody2D

@export_category("Camera Smoothing")
@export var smoothing_enabled: bool = false
@export_range(1, 10) var smoothing_distance: int = 5

func _physics_process(delta):
	if player:
		var camera_position: Vector2 = player.global_position

		var weight: float

		if smoothing_enabled:
			weight = float(11 - smoothing_distance) / 10.0
			camera_position = lerp(global_position, camera_position, weight)

		print("Weight: ", weight, " Camera Position: ", camera_position, " Camera Pixel Floor: ", camera_position.floor())

		global_position = camera_position.floor()
