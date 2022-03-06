import 'package:flutter/material.dart';

class DissmissibleBackgroundView extends StatelessWidget {
  const DissmissibleBackgroundView({
    Key? key,
    required this.alignment,
  }) : super(key: key);

  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      color: Colors.red[900],
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
    );
  }
}
