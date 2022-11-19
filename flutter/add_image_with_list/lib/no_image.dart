import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class NoImage extends StatelessWidget {
  final void Function() handler;

  const NoImage({
    Key? key,
    required this.handler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: GestureDetector(
        onTap: handler,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: DottedBorder(
            borderType: BorderType.RRect,
            color: Colors.green,
            radius: const Radius.circular(5.0),
            strokeWidth: 2,
            dashPattern: const [5, 5],
            child: const SizedBox(
              height: 150,
              width: 150,
              child: Center(
                child: Icon(
                  Icons.add_a_photo_rounded,
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
