extends CanvasLayer
var mana_amount = 9000
var remaining_mana = mana_amount
const BAR_LENGTH = 352

func reduce_mana(amount):
	if remaining_mana <= 0 or amount > remaining_mana: 
		$AnimationPlayer.play("NoMana")
		return
	var visual_amount = range_lerp(amount, 0, mana_amount, 0, BAR_LENGTH)
	$ConsumedMana.rect_position.x -= visual_amount
	$ConsumedMana.rect_size.x += visual_amount
	remaining_mana -= amount
