import 'package:dragdemo/fruitbox.dart';
import 'package:flutter/material.dart';

class DiffrentDragTargets extends StatelessWidget {
  const DiffrentDragTargets(
      {Key? key,
      required this.onInsideTargetChanged,
      required this.onActiveEmojiChanged,
      required this.dragBoxactiveEmoji,
      required this.currentEmojiDragBox,
      required this.dragBoxColor})
      : super(key: key);
  final Color dragBoxColor;
  final String dragBoxactiveEmoji;
  final String currentEmojiDragBox;
  final ValueChanged<bool> onInsideTargetChanged;
  final ValueChanged<String> onActiveEmojiChanged;

  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      builder: (context, data, rejectedData) {
        return Container(
          width: 100,
          height: 100,
          color: dragBoxColor,
          child: dragBoxactiveEmoji == '' ? null : FruitBox(dragBoxactiveEmoji),
        );
      },
      onAccept: (emoji) {
        onInsideTargetChanged(true);
        onActiveEmojiChanged(emoji);
      },
      onWillAccept: (emoji) {
        return emoji == currentEmojiDragBox ? true : false;
      },
    );
  }
}
