import 'package:flutter/material.dart';

class ItemName extends StatelessWidget {
  const ItemName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Text(
        'A random picture',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
