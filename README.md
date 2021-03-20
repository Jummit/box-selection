# Box Selection Plugin

## Usage

Add a `BoxSelection` node to the tree. To make nodes selectable, add them to the `Selectable` group and add a `selected` property to their script. This property is then set by the box selection if the node is selected/deselected.

### Custom Selection Styles

To configure the box style, create a new `StyleBox` and set it as the `box_style` of the `BoxSelection` node.
