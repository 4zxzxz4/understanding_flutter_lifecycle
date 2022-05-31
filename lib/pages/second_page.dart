import 'dart:math';

import 'package:flutter/material.dart';

import 'shared_counter.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() {
    print('${this.runtimeType}: createState');
    return _SecondPageState();
  }
}

class _SecondPageState extends State<SecondPage> {
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
                Text(''),
                Text(
                    'hello aspect helloCounter is ${SharedCounter.withAspect(context, aspect: CounterAspect.hello).helloCounter}'),
                Text(
                    'hello aspect worldCounter is ${SharedCounter.withAspect(context, aspect: CounterAspect.hello).worldCounter}'),
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
  void didUpdateWidget(SecondPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('${this.runtimeType}: didUpdateWidget');
  }

  @override
  void initState() {
    super.initState();
    print('${this.runtimeType}: initState');
  }
}
