import 'dart:math';

import 'package:flutter/material.dart';

import 'shared_counter.dart';

class FifthPage extends StatefulWidget {
  const FifthPage({Key? key}) : super(key: key);

  @override
  State<FifthPage> createState() {
    print('${this.runtimeType}: createState');
    return _FifthPageState();
  }
}

class _FifthPageState extends State<FifthPage> {
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
                Text('hello aspect counter is ${SharedCounter.withBuild(context, build: true).helloCounter}'),
                Text('world aspect counter is ${SharedCounter.withBuild(context, build: true).worldCounter}'),
              ],
            ),
          ),
        ));
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
  void didUpdateWidget(FifthPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('${this.runtimeType}: didUpdateWidget');
  }

  @override
  void initState() {
    super.initState();
    print('${this.runtimeType}: initState');
  }
}
