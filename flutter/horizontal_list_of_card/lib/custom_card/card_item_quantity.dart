import 'package:flutter/material.dart';

class CardItemQuantity extends StatelessWidget {
  const CardItemQuantity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(
        5.0,
      ),
      child: Text("Qty: 5"),
    );
  }
}
