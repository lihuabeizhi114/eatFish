extends Node2D

@export var fish_scene : PackedScene
@export var fish_scene1 : PackedScene
@export var shark_scene : PackedScene
@export var spawn_timer : Timer
@export var score_label : Label
@export var health_label : Label

func _ready():
	
	
	print("游戏管理器初始化开始")
	
	if health_label:
		health_label.text = "生命: 3"
		print("生命值标签初始化完成: 生命: 3")
	else:
		print("警告: 未找到生命值标签引用")
	
	# 检查场景引用
	if fish_scene:
		print("小鱼场景引用有效")
	else:
		print("错误: 小鱼场景引用无效")
		
	if fish_scene1:
		print("剑鱼场景引用有效")
	else:
		print("错误: 剑鱼场景引用无效")
		
	if shark_scene:
		print("鲨鱼场景引用有效")
	else:
		print("错误: 鲨鱼场景引用无效")
		
	print("游戏管理器初始化完成")

func _process(delta: float) -> void:
	spawn_timer.wait_time -= 0.2 * delta
	spawn_timer.wait_time = clamp(spawn_timer.wait_time,1,3)

	score_label.text = "Score:" + str(Global.get_current_score())


func _spawn_fish() -> void:
	var fish_node = fish_scene.instantiate()
	fish_node.position = Vector2(800,randf_range(-170,320))
	get_tree().current_scene.add_child(fish_node)
	
	var fish_node1 = fish_scene1.instantiate()
	fish_node1.position = Vector2(800,randf_range(-170,320))
	get_tree().current_scene.add_child(fish_node1)
	
	if randf() < 0.3:
		var shark_node = shark_scene.instantiate()
		shark_node.position = Vector2(-500, randf_range(-170, 320))
		get_tree().current_scene.add_child(shark_node)
	
	
