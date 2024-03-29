import 'package:dropdown_with_search_and_add/dropdown_list.dart';
import 'package:dropdown_with_search_and_add/list_item.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const MyHomePage({super.key, required this.title});

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
  final _controller = TextEditingController();
  var list = [
    ListItem(isAddable: false, item: 'Alaskan Malamute'),
    ListItem(isAddable: false, item: 'Bohemian Shepherd'),
    ListItem(isAddable: false, item: 'Cane Corso'),
    ListItem(isAddable: false, item: 'Dobermann'),
    ListItem(isAddable: false, item: 'English Mastiff'),
    ListItem(isAddable: false, item: 'Finnish Hound'),
    ListItem(isAddable: false, item: 'Great Dane'),
  ];

  List<ListItem> filtered = [];
  var showDropdown = false;

  @override
  void initState() {
    filtered = list;
    super.initState();
  }

  InputDecoration decoration = InputDecoration(
    border: const OutlineInputBorder(),
    hintText: 'Search . . .',
    suffixIcon: IconButton(
      onPressed: () {},
      icon: const Icon(Icons.arrow_drop_down_rounded),
    ),
  );

  InputDecoration _inputCrossDecoration() {
    return InputDecoration(
      border: const OutlineInputBorder(),
      hintText: 'Search . . .',
      suffixIcon: IconButton(
        onPressed: handleSuffixTap,
        icon: const Icon(Icons.clear_rounded),
      ),
    );
  }

  InputDecoration _inputArrowDecoration() {
    return InputDecoration(
      border: const OutlineInputBorder(),
      hintText: 'Search . . .',
      suffixIcon: IconButton(
        onPressed: handleSuffixTap,
        icon: const Icon(Icons.arrow_drop_down_rounded),
      ),
    );
  }

  handleInputChange(String value) {
    if (value.isNotEmpty) {
      var temp = [...list];
      var exact = false;

      temp = temp.where((i) {
        var iInLowerCase = i.item.toLowerCase();
        var valueInLowerCase = value.toLowerCase();
        if (!exact) {
          exact = iInLowerCase == valueInLowerCase;
        }
        return iInLowerCase.contains(valueInLowerCase);
      }).toList();

      if (!exact) {
        temp.insert(
          0,
          ListItem(
            isAddable: true,
            item: '+ Add "$value" to list',
            value: value,
          ),
        );
      }

      setState(() {
        decoration = _inputCrossDecoration();
        showDropdown = true;
        filtered = temp;
      });
      return;
    }

    setState(() {
      decoration = _inputArrowDecoration();
      showDropdown = false;
      filtered = list;
    });
  }

  handleSuffixTap() {
    if (_controller.text.isNotEmpty) {
      _controller.clear();
      setState(() {
        decoration = _inputArrowDecoration();
        showDropdown = false;
        filtered = list;
      });
      return;
    }

    setState(() {
      showDropdown = !showDropdown;
    });
  }

  handleAddToList(String value) {
    var temp = [...list];
    temp.insert(0, ListItem(isAddable: false, item: value));
    setState(() {
      list = temp;
      filtered = list;
      showDropdown = false;
    });
  }

  handleSelect(String value) {
    _controller.text = value;
    setState(() {
      filtered = list;
      showDropdown = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                onChanged: handleInputChange,
                decoration: _controller.text.isNotEmpty
                    ? _inputCrossDecoration()
                    : _inputArrowDecoration(),
              ),
              if (showDropdown)
                DropdownList(
                  list: filtered,
                  handleTap: handleAddToList,
                  handleSelect: handleSelect,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
