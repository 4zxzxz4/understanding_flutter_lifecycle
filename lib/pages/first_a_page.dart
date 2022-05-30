import 'dart:math';

import 'package:flutter/material.dart';

class FirstAPage extends StatefulWidget {
  const FirstAPage({Key? key}) : super(key: key);

  @override
  State<FirstAPage> createState() {
    print('${this.runtimeType}: createState');
    return _FirstAPageState();
  }
}

class _FirstAPageState extends State<FirstAPage> {
  @override
  Widget build(BuildContext context) {
    print('${this.runtimeType}: build');
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      ),
      child: Center(
        child: Text('${this.runtimeType}'),
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
  void didUpdateWidget(FirstAPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('${this.runtimeType}: didUpdateWidget');
  }

  @override
  void initState() {
    super.initState();
    print('${this.runtimeType}: initState');
  }
}
