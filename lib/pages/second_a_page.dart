import 'dart:math';

import 'package:flutter/material.dart';
import 'package:understanding_flutter_lifecycle/pages/shared_counter.dart';

class SecondAPage extends StatefulWidget {
  const SecondAPage({Key? key}) : super(key: key);

  @override
  State<SecondAPage> createState() {
    print('${this.runtimeType}: createState');
    return _SecondAPageState();
  }
}

class _SecondAPageState extends State<SecondAPage> {
  @override
  Widget build(BuildContext context) {
    print('${this.runtimeType}: build');
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      ),
      child: Center(
        child: Column(
          children: [
            Text('${this.runtimeType}\n(shared counter is ${SharedCounter.of(context).state.value})'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      SharedCounter.of(context).state.increase();
                    },
                    child: Text('increase\nshared counter')),
                SizedBox(width: 5),
                ElevatedButton(
                    onPressed: () {
                      SharedCounter.of(context).state.decrease();
                    },
                    child: Text('decrease\nshared counter')),
              ],
            ),
          ],
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
  void didUpdateWidget(SecondAPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('${this.runtimeType}: didUpdateWidget');
  }

  @override
  void initState() {
    super.initState();
    print('${this.runtimeType}: initState');
  }
}
