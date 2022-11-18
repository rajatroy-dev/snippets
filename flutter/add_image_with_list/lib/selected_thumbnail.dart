import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class SelectedThumbnail extends StatelessWidget {
  final bool isThumbnail;
  final Widget child;

  const SelectedThumbnail({
    Key? key,
    this.isThumbnail = false,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isThumbnail
        ? DottedBorder(
            borderType: BorderType.RRect,
            color: Colors.green,
            radius: const Radius.circular(5.0),
            strokeWidth: 2,
            dashPattern: const [5, 5],
            child: child)
        : child;
  }
}
