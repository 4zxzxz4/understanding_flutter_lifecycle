import 'dart:math';

import 'package:flutter/material.dart';
import 'package:understanding_flutter_lifecycle/pages/fifth_page.dart';
import 'package:understanding_flutter_lifecycle/pages/fourth_page.dart';
import 'package:understanding_flutter_lifecycle/pages/shared_counter.dart';
import 'package:understanding_flutter_lifecycle/pages/third_page.dart';

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
    return CounterWidget(
      child: Builder(builder: (context) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
              color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            ),
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  Expanded(child: FirstPage()),
                  Expanded(child: SecondPage()),
                  Expanded(child: ThirdPage()),
                  Expanded(child: FourthPage()),
                  Expanded(child: FifthPage()),
                ],
              ),
            ),
          ),
        );
      }),
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
