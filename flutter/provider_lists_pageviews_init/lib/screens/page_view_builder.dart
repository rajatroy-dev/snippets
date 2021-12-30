import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/data.dart';

class PageViewBuilderScreen extends StatefulWidget {
  const PageViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<PageViewBuilderScreen> createState() => _PageViewBuilderScreenState();
}

class _PageViewBuilderScreenState extends State<PageViewBuilderScreen> {
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
          builder: (_, data, __) => PageView.builder(
            controller: PageController(viewportFraction: 0.9),
            itemCount: data.getData.length,
            itemBuilder: (ctx, index) => Card(
              margin: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 10,
              ),
              elevation: 2,
              child: Center(
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
    );
  }
}
