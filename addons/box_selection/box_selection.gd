extends Node2D
class_name BoxSelection, "box_selection_icon.svg"

"""
A box selection

Draws a box selection when clicking and then dragging with the left mouse
button. Sets `selected` to true on nodes that are in the `Selectable` group
and inside the selection.
"""

export var box_style : StyleBox = preload("selection_style.tres")

# If the user is currently drawing a selection.
var selecting := false
# The selected rect.
var rect : Rect2

func _unhandled_input(event : InputEvent) -> void:
	if get_viewport().gui_is_dragging():
		return
	
	if event is InputEventMouseMotion and event.button_mask == BUTTON_LEFT:
		if selecting:
			rect.size = -(rect.position - get_local_mouse_position())
			for selectable in get_tree().get_nodes_in_group("Selectable"):
				selectable.selected = rect.abs().has_point(
						selectable.global_position)
		else:
			# Deselect everything when starting a new selection.
			get_tree().set_group("Selectable", "selected", false)
			selecting = true
			rect = Rect2(get_local_mouse_position(), Vector2.ZERO)
		update()
	elif event is InputEventMouseButton and not event.pressed:
		selecting = false
		update()


func _draw() -> void:
	if selecting:
		box_style.draw(get_canvas_item(), rect.abs())
