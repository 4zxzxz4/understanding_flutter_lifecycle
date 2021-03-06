import 'dart:math';

import 'package:flutter/material.dart';
import 'package:understanding_flutter_lifecycle/pages/first_a_page.dart';

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
    return Container(
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${this.runtimeType}($counter)'),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                },
                child: Text('increase counter')),
            Container(
              padding: const EdgeInsets.all(40),
              child: FirstAPage(),
            )
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
