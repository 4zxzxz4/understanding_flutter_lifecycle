import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  final Widget child;

  const CounterWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<CounterWidget> createState() => CounterWidgetState();
}

class CounterWidgetState extends State<CounterWidget> {
  int helloCounter = 0;
  int worldCounter = 0;

  increaseHelloCounter() {
    super.setState(() {
      helloCounter++;
    });
  }

  decreaseHelloCounter() {
    super.setState(() {
      helloCounter--;
    });
  }

  increaseWorldCounter() {
    super.setState(() {
      worldCounter++;
    });
  }

  decreaseWorldCounter() {
    super.setState(() {
      worldCounter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SharedCounter(
      helloCounter: helloCounter,
      worldCounter: worldCounter,
      increaseHelloCounter: increaseHelloCounter,
      decreaseHelloCounter: decreaseHelloCounter,
      increaseWorldCounter: increaseWorldCounter,
      decreaseWorldCounter: decreaseWorldCounter,
      child: widget.child,
    );
  }
}

enum CounterAspect {
  hello,
  world,
}

class SharedCounter extends InheritedModel<CounterAspect> {
  final int helloCounter;
  final int worldCounter;
  final VoidCallback increaseHelloCounter;
  final VoidCallback decreaseHelloCounter;
  final VoidCallback increaseWorldCounter;
  final VoidCallback decreaseWorldCounter;

  const SharedCounter({
    super.key,
    required this.helloCounter,
    required this.worldCounter,
    required this.increaseHelloCounter,
    required this.decreaseHelloCounter,
    required this.increaseWorldCounter,
    required this.decreaseWorldCounter,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant SharedCounter oldWidget) {
    return helloCounter != oldWidget.helloCounter || worldCounter != oldWidget.worldCounter;
  }

  @override
  bool updateShouldNotifyDependent(covariant SharedCounter oldWidget, Set<CounterAspect> aspects) {
    // 각 위젯의 aspect와 현재 inheritedModel의 값을 평가하며 apsect에 종속되어있는 값이 바뀌었을 때
    // inheritFrom을 통해 inheritedModel을 사용하고 있는 위젯이 리빌드 되어야하는지 결정한다
    print(aspects);
    return ((helloCounter != oldWidget.helloCounter) && aspects.contains(CounterAspect.hello)) ||
        (worldCounter != oldWidget.worldCounter && aspects.contains(CounterAspect.world));
  }

  static SharedCounter withAspect(BuildContext context, {required CounterAspect aspect}) {
    return InheritedModel.inheritFrom<SharedCounter>(context, aspect: aspect)!;
  }

  static SharedCounter withBuild(BuildContext context, {bool build = false}) {
    return build
        ? context.dependOnInheritedWidgetOfExactType<SharedCounter>()!
        : context.findAncestorWidgetOfExactType<SharedCounter>()!;
  }
}
