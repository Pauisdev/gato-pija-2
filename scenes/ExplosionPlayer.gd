extends AudioStreamPlayer
var sound_1 = load("res://sound_effects/explode.wav")
var sound_2 = load("res://sound_effects/explode2.wav")
var sound_3 = load("res://sound_effects/explode3.wav")
var track_player = player()

func play_next():
	track_player = track_player.resume()

func player():
	yield()
	while true:
		stream = sound_1
		play()
		yield()
		stream = sound_2
		play()
		yield()
		stream = sound_3
		play()
		yield()
