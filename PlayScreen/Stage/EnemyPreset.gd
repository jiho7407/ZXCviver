extends CharacterBody2D

# Declare member variables
var hp: int
var speed: float
var exp: int
var size: float
var sprite: String


var ExpTamaScene = preload("res://PlayScreen/ExpTama.tscn")
var ExpTama = ExpTamaScene.instantiate()

# Initialization
func init(enemy_type: String, hp: int, speed: float, exp: int, size: float):
	var EnemyData = EnemyEnum.getEnemyData(enemy_type)
	self.hp = hp
	self.speed = speed
	self.exp = exp
	self.size = size
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
	anim_sprite.scale.x = size
	anim_sprite.scale.y = size
	$Area2D/CollisionShape2D.scale.x = size
	$Area2D/CollisionShape2D.scale.y = size
	
	self.add_child(anim_sprite)
	anim_sprite.position = Vector2(0,0)
	anim_sprite.play("idle")


func _physics_process(delta):
	velocity = (Player.position - position).normalized() * speed
	move_and_slide()
	if hp <= 0:
		get_node("/root/PlayScreen/Exp").add_child(ExpTama)
		ExpTama.position = position
		ExpTama.EXP = exp
		queue_free()


