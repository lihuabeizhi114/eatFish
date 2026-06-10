extends Control

@export var game_scene_path: String ="res://Scene/Main.tscn"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	if has_node("/root/Global"):
		
		var global = get_node("/root/Global")
		
		if global.has_method("get_final_score"):
			
			var final_score = global.get_final_score()
			
			
			if has_node("finalscore"):
				
				$finalscore.text = "最终得分: " + str(final_score)
				
			else:
				print("错误: 找不到finalscore Label节点")
		else:
			print("错误: Global单例没有get_final_score方法")
	else:
		print("错误: Global单例不存在")
		
	print("=== 调试信息结束 ===")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_restart_pressed() -> void:
	Global.set_current_score(0)
	var _error = get_tree().change_scene_to_file(game_scene_path)


func _on_exit_game_pressed() -> void:
	get_tree().quit()
