import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/data.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  _ListViewScreenState createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<Data>(context, listen: false).fetchData();
    });
    super.initState();
  }

  List<Widget> widgets(List<String> data) {
    List<Widget> _widgets = [];

    for (var i = 0; i < data.length; i++) {
      _widgets.add(
        Card(
          margin: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 10,
          ),
          elevation: 2,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 50,
              ),
              child: Text(
                data[i],
                style: const TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return _widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 220,
        child: Consumer<Data>(
          builder: (_, data, __) => ListView(
            scrollDirection: Axis.horizontal,
            children: widgets(data.getData),
          ),
        ),
      ),
    );
    ;
  }
}
