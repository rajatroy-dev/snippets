import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            SizedBox(
              width: 200,
              height: 320,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      topRight: Radius.circular(5.0),
                    ),
                    child: Image.network(
                      'https://picsum.photos/200',
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'A random picture',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 5.0),
                          child: Icon(Icons.location_on_rounded, size: 16.0),
                        ),
                        Text('A random location'),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(
                      5.0,
                    ),
                    child: Text("Qty: 5"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Wrap(
                      clipBehavior: Clip.hardEdge,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3.0),
                          margin: const EdgeInsets.only(right: 4.0),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(2.0),
                            ),
                            color: Colors.grey[300],
                          ),
                          child: const Text("#abc"),
                        ),
                        Container(
                          padding: const EdgeInsets.all(3.0),
                          margin: const EdgeInsets.only(right: 4.0),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(2.0),
                            ),
                            color: Colors.grey[300],
                          ),
                          child: const Text("#abc"),
                        ),
                        Container(
                          padding: const EdgeInsets.all(3.0),
                          margin: const EdgeInsets.only(right: 4.0),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(2.0),
                            ),
                            color: Colors.grey[300],
                          ),
                          child: const Text("#abc"),
                        ),
                        Container(
                          padding: const EdgeInsets.all(3.0),
                          margin: const EdgeInsets.only(right: 4.0),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(2.0),
                            ),
                            color: Colors.grey[300],
                          ),
                          child: const Text("#abc"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            FloatingActionButton.small(
              onPressed: () {},
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.favorite_rounded,
                color: Colors.green,
              ),
            ),
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
