extends Node2D
export var song: AudioStream

func _ready():
	if WorldThemePlayer.is_playing(): return
	WorldThemePlayer.play(song)

func _process(delta):
	if Input.is_action_just_pressed("go to main menu"):
		WorldThemePlayer.stop()
		SceneTransition.change_scene("res://scenes/MainMenu.tscn")

func _on_UI_skill_menu_opened():
	$WorldTemplate.set_night()


func _on_UI_skill_menu_closed():
	$WorldTemplate.set_day()


func _on_Player_died():
	if Input.is_action_just_pressed("retry"):
		var current_scene = get_tree().current_scene.filename
		SceneTransition.change_scene(current_scene)
	$UI/DeathPopup.show()

