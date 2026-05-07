extends CanvasLayer

func play():
	$Animator.play("CoverScreen")
	#visible = true

func play_backwards():
	visible = true
	$Animator.play_backwards("CoverScreen")
