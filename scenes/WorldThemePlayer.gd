extends Node2D
var music_position = 0

func play(song: AudioStream):
	$AudioStreamPlayer.stream = song
	$AudioStreamPlayer.play()
	
func stop():
	$AudioStreamPlayer.stop()

func is_playing():
	return $AudioStreamPlayer.is_playing()

func pause():
	music_position = $AudioStreamPlayer.get_playback_position()
	$AudioStreamPlayer.stop()

func resume():
	$AudioStreamPlayer.play(music_position)
