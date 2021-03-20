extends Sprite

var selected : bool setget set_selected

func set_selected(to : bool) -> void:
	selected = to
	modulate = Color.green if selected else Color.white
	scale = Vector2.ONE * (1.2 if selected else 1.0)
