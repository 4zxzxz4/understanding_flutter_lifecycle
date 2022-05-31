import 'dart:math';

import 'package:flutter/material.dart';
import 'package:understanding_flutter_lifecycle/pages/shared_counter.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() {
    print('${this.runtimeType}: createState');
    return _FirstPageState();
  }
}

class _FirstPageState extends State<FirstPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    print('${this.runtimeType}: build');
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('In Hello Aspect'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        SharedCounter.withBuild(context, build: false).increaseHelloCounter();
                      },
                      child: Text('+ hello counter')),
                  SizedBox(width: 5),
                  ElevatedButton(
                      onPressed: () {
                        SharedCounter.withBuild(context, build: false).decreaseHelloCounter();
                      },
                      child: Text('- hello counter')),
                ],
              ),
              SizedBox(width: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        SharedCounter.withBuild(context, build: false).increaseWorldCounter();
                      },
                      child: Text('+  world counter')),
                  SizedBox(width: 5),
                  ElevatedButton(
                      onPressed: () {
                        SharedCounter.withBuild(context, build: false).decreaseWorldCounter();
                      },
                      child: Text('- world counter')),
                ],
              ),
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
  void didUpdateWidget(FirstPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('${this.runtimeType}: didUpdateWidget');
  }

  @override
  void initState() {
    super.initState();
    print('${this.runtimeType}: initState');
  }
}
