import 'dart:math';

import 'package:flutter/material.dart';
import 'package:understanding_flutter_lifecycle/pages/second_a_page.dart';

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
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${this.runtimeType}'),
            Container(
              padding: EdgeInsets.all(40),
              child: SecondAPage(),
            ),
          ],
        ),
      ),
    );
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
