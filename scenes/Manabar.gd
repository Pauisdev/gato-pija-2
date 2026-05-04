extends CanvasLayer
export var remaining_mana = 352

func reduce_mana(amount):
	if remaining_mana <= 0 or amount > remaining_mana: 
		$AnimationPlayer.play("NoMana")
		return
	$ConsumedMana.rect_position.x -= amount
	$ConsumedMana.rect_size.x += amount
	remaining_mana -= amount
