extends Camera2D

@export var player: CharacterBody2D
@export var map: TileMapLayer

@onready var label = $Label
	
#func time_left_to_live():
	#var time_left = GlobalAutoload.timer.time_left
	#var minute = floor(time_left / 60)
	#var second = int(time_left) % 60
	#return [minute, second]
	#

func _ready():
			# Get the rectangle of used cells in the TileMapLayer
			var map_rect = map.get_used_rect()

			# Get the size of each tile in pixels
			var tile_size = map.tile_set.tile_size

			# Calculate the world size in pixels
			var world_size = map_rect.size * tile_size

		# Set camera limits
			limit_right = world_size.x
			limit_bottom = world_size.y
			#GlobalAutoload.timer.timeout.connect(time_left_to_live)

func _process(delta: float) -> void:
	if player:
		position = player.position
	#label.text = "%02d:%02d" % time_left_to_live()
