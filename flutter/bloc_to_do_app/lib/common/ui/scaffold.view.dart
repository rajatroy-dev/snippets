import 'package:flutter/material.dart';

class ScaffoldView extends StatelessWidget {
  const ScaffoldView({
    Key? key,
    required this.body,
    this.floatingActionButton,
  }) : super(key: key);

  final String title = 'Todo';
  final Widget body;
  final FloatingActionButton? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
