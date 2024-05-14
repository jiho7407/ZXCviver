extends CharacterBody2D

# Declare member variables
var HP: int
var SPEED: float
var EXP: int
var hp: int
var Sprite: String
var Size: float

# Initialization
func initialize(enemy_type: String):
	var EnemyData = EnemyDatabase.getEnemyData(enemy_type)
	if EnemyData:
		self.hp = EnemyData["HP"]
		self.SPEED = EnemyData["SPEED"]
		self.EXP = EnemyData["EXP"]
		self.Size = EnemyData["Size"]
	var anim_sprite := AnimatedSprite2D.new()
	var sprite_frames := SpriteFrames.new()
	var full_spritesheet : Texture = load(EnemyData["Sprite"])
	var texture_size = full_spritesheet.get_size()
	var sprite_size = Vector2(texture_size.y,texture_size.y)
	var num_columns : int = (texture_size.x/sprite_size.x)
	sprite_frames.add_animation("idle")
	sprite_frames.set_animation_loop("idle",true)
	sprite_frames.set_animation_speed("idle", 2*num_columns)
	for x_coords in range(num_columns):
		for y_coords in range(int(texture_size.y/sprite_size.y)):
			var frame_tex := AtlasTexture.new()
			frame_tex.atlas = full_spritesheet
			frame_tex.region = Rect2(Vector2(x_coords,y_coords)*sprite_size,sprite_size)
			sprite_frames.add_frame("idle",frame_tex,y_coords*num_columns+x_coords)
	anim_sprite.frames = sprite_frames
	anim_sprite.scale.x = Size
	anim_sprite.scale.y = Size
	$Area2D/CollisionShape2D.scale.x = Size
	$Area2D/CollisionShape2D.scale.y = Size
	
	self.add_child(anim_sprite)
	anim_sprite.position = Vector2(0,0)
	anim_sprite.play("idle")


func _physics_process(delta):
	velocity = (Player.position - position).normalized() * SPEED
	move_and_slide()
	if hp <= 0:
		Player.Exp += EXP
		queue_free()


