import 'package:flutter/material.dart';

class ItemLocation extends StatelessWidget {
  const ItemLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 4,
      ),
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child: Icon(Icons.location_on_rounded, size: 16.0),
          ),
          Text('A random location'),
        ],
      ),
    );
  }
}
