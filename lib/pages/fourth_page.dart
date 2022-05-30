import 'dart:math';

import 'package:flutter/material.dart';

import 'shared_counter.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({Key? key}) : super(key: key);

  @override
  State<FourthPage> createState() {
    print('${this.runtimeType}: createState');
    return _FourthPageState();
  }
}

class _FourthPageState extends State<FourthPage> {
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
            child: Text(
                'world aspect counter is ${SharedCounter.withAspect(context, aspect: CounterAspect.world).worldCounter}'),
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
  void didUpdateWidget(FourthPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('${this.runtimeType}: didUpdateWidget');
  }

  @override
  void initState() {
    super.initState();
    print('${this.runtimeType}: initState');
  }
}
