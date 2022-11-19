import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class SelectedThumbnail extends StatelessWidget {
  final bool isThumbnail;
  final void Function(int) handler;
  final Widget child;

  const SelectedThumbnail({
    Key? key,
    this.isThumbnail = false,
    required this.child,
    required this.handler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: isThumbnail
          ? GestureDetector(
              onTap: () => handler,
              child: DottedBorder(
                  borderType: BorderType.RRect,
                  color: Colors.green,
                  radius: const Radius.circular(5.0),
                  strokeWidth: 2,
                  dashPattern: const [5, 5],
                  child: child),
            )
          : child,
    );
  }
}
