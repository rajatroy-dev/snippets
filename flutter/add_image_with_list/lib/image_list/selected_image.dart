import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class SelectedImage extends StatelessWidget {
  final bool isThumbnail;
  final void Function() handler;
  final Widget child;

  const SelectedImage({
    Key? key,
    this.isThumbnail = false,
    required this.child,
    required this.handler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: handler,
        child: isThumbnail
            ? DottedBorder(
                borderType: BorderType.RRect,
                color: Colors.green,
                radius: const Radius.circular(5.0),
                strokeWidth: 2,
                dashPattern: const [5, 5],
                child: child)
            : child,
      ),
    );
  }
}
