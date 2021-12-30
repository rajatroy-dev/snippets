import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/data.dart';

class ListViewBuilderScreen extends StatefulWidget {
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<Data>(context, listen: false).fetchData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 220,
        child: Consumer<Data>(
          builder: (_, data, __) => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.getData.length,
            itemBuilder: (ctx, index) => Card(
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
                    data.getData[index],
                    style: const TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
