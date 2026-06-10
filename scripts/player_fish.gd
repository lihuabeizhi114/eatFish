extends CharacterBody2D

var move_speed : float = 500

@onready var fish_sprite = $AnimatedSprite2D
@export var max_scale : float = 2.0
@export var detect_area: Area2D
@export var grow_speed: float = 2.0
var target_scale: float = 0.5
var is_growing: bool = false
var health: int = 3




func _process(_delta: float) -> void:
	
	velocity = Input.get_vector("left","right","up","down") * move_speed
	move_and_slide()
	
	
	var input_dir = Input.get_vector("left","right","up","down")
	if input_dir.x < 0:
		fish_sprite.flip_h = false
	elif input_dir.x > 0:
		fish_sprite.flip_h = true
		
		
	if is_growing:
		
		scale = lerp(scale, Vector2(target_scale, target_scale), grow_speed * _delta)
		
		if abs(scale.x - target_scale) < 0.01:
			scale = Vector2(target_scale, target_scale)  
			is_growing = false




func _on_area_2d_area_entered(area: Area2D) -> void:
	
	if area is Area2D:
		var current_score = Global.get_current_score()

		var has_fish_type = area.get_fish_type()
		var has_required_score = area.get_required_score()
			

		
		if has_fish_type and has_required_score:
			var _fish_type = area.get_fish_type()
			var required_score = area.get_required_score()
			
			
			
			if current_score < required_score:

				health -= 1
				
				var health_label = get_node("/root/Main/CanvasLayer/health")
				if health_label:
					health_label.text = "生命: " + str(health)
					
					
				if health <= 0:
					
					Global.set_final_score(current_score)
					
					get_tree().change_scene_to_file("res://Scene/game_over.tscn")
					return
			else:
				
				target_scale = min(target_scale + 0.02, max_scale)
				is_growing = true
				
		else:
			
			target_scale = min(target_scale + 0.01, max_scale)
			is_growing = true
			
		

		
