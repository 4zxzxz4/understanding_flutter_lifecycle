import 'package:flutter/material.dart';

class SharedCounter extends InheritedWidget {
  final int value = 11;

  const SharedCounter({super.key, required super.child});

  @override
  bool updateShouldNotify(covariant SharedCounter oldWidget) {
    throw UnimplementedError();
  }

  static SharedCounter of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SharedCounter>()!;
  }
}
