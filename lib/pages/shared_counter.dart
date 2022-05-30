import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  final Widget child;

  const CounterWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<CounterWidget> createState() => CounterWidgetState();
}

class CounterWidgetState extends State<CounterWidget> {
  int leftCounter = 0;
  int rightCounter = 0;

  increaseLeftCounter() {
    super.setState(() {
      leftCounter++;
    });
  }

  increaseRightCounter() {
    super.setState(() {
      rightCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SharedCounter(
      leftCounter: leftCounter,
      rightCounter: rightCounter,
      increaseLeftCounter: increaseLeftCounter,
      increaseRightCounter: increaseRightCounter,
      child: widget.child,
    );
  }
}

class SharedCounter extends InheritedWidget {
  final int leftCounter;
  final int rightCounter;
  final VoidCallback increaseLeftCounter;
  final VoidCallback increaseRightCounter;

  const SharedCounter({
    super.key,
    required this.leftCounter,
    required this.rightCounter,
    required this.increaseLeftCounter,
    required this.increaseRightCounter,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant SharedCounter oldWidget) {
    return true;
  }

  static SharedCounter of(BuildContext context, {bool build = true}) {
    return build
        ? context.dependOnInheritedWidgetOfExactType<SharedCounter>()!
        : context.findAncestorWidgetOfExactType<SharedCounter>()!;
  }
}
