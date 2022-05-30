import 'dart:math';

import 'package:flutter/material.dart';

import 'first_page.dart';
import 'second_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() {
    print('${this.runtimeType}: createState');
    return _RootPageState();
  }
}

class _RootPageState extends State<RootPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    print('${this.runtimeType}: build');
    return Scaffold(
      body: Container(
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        padding: const EdgeInsets.all(40),
        child: Center(
          child: Column(
            children: [
              Text('${this.runtimeType}($counter)'),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter++;
                    });
                  },
                  child: Text('increase counter')),
              Expanded(child: FirstPage()),
              Expanded(child: SecondPage()),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    print('${this.runtimeType}: setState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('${this.runtimeType}: didChangeDependencies');
  }

  @override
  void activate() {
    super.activate();
    print('${this.runtimeType}: activate');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('${this.runtimeType}: deactivate');
  }

  @override
  void didUpdateWidget(RootPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('${this.runtimeType}: didUpdateWidget');
  }

  @override
  void initState() {
    super.initState();
    print('${this.runtimeType}: initState');
  }
}
