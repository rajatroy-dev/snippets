import 'package:flutter/material.dart';

class ItemQuantity extends StatelessWidget {
  const ItemQuantity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Text("Qty: 5"),
    );
  }
}
