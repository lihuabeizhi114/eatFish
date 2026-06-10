extends Control

@export var game_scene_path: String ="res://Scene/Main.tscn"
@export var help_scene_path: String = "res://Scene/game_help.tscn"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_startgame_pressed() -> void:
	var _error = get_tree().change_scene_to_file(game_scene_path)


func _on_exitgame_pressed() -> void:
	get_tree().quit()


func _on_button_pressed() -> void:
	var error = get_tree().change_scene_to_file(help_scene_path)
	if error != OK:
		print("加载帮助场景失败，错误代码: ", error)
