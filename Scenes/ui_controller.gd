extends Control

func _on_player_score_changed(score):
	$Score.text = "Score: %s" % score




func _on_player_hearts_changed(hearts):
	pass
