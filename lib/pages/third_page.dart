import 'dart:math';

import 'package:flutter/material.dart';
import 'package:understanding_flutter_lifecycle/pages/shared_counter.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() {
    print('${this.runtimeType}: createState');
    return _ThirdPageState();
  }
}

class _ThirdPageState extends State<ThirdPage> {
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
              ElevatedButton(
                  onPressed: () {
                    SharedCounter.withAspect(context, aspect: CounterAspect.world).increaseWorldCounter();
                  },
                  child: Text('increase world aspect\ncounter')),
              SizedBox(width: 5),
              ElevatedButton(
                  onPressed: () {
                    SharedCounter.withAspect(context, aspect: CounterAspect.world).decreaseWorldCounter();
                  },
                  child: Text('decrease world apspect\ncounter')),
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
  void didUpdateWidget(ThirdPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('${this.runtimeType}: didUpdateWidget');
  }

  @override
  void initState() {
    super.initState();
    print('${this.runtimeType}: initState');
  }
}
