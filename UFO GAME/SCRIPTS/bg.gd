extends ParallaxBackground

@export var bg_texture: CompressedTexture2D = preload ("res://ASSETS/TRACKS/Background64X64.png")
@export var scroll_speed = 5

@onready var sprite = $ParallaxLayer/Sprite2D

func _ready():
	sprite.texture = bg_texture

#scrolling effect
func _process(delta):
	sprite.region_rect.position += delta * Vector2(scroll_speed, scroll_speed)
	if sprite.region_rect.position >= Vector2(64, 64):
		sprite.region_rect.position = Vector2.ZERO
		
