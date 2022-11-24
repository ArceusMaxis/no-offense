extends Label

var score = 0
onready var scorekeep = get_node("/root/Scoremanager")

func _process(_delta):
	if scorekeep.highscore < score:
		scorekeep.highscore = score

func _on_enemy_die():
	score += 1
	scorekeep.score = score
	text = "SCORE : %s" % score

