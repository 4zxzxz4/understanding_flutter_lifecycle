import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  final Widget child;

  const CounterWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<CounterWidget> createState() => CounterWidgetState();
}

class CounterWidgetState extends State<CounterWidget> {
  int value = 1;

  increase() {
    super.setState(() {
      value++;
    });
  }

  decrease() {
    super.setState(() {
      value--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SharedCounter(state: this, child: widget.child);
  }
}

// 어떻게 이 위젯을 리빌드 시킬 수 있을까? → 부모 위젯이 리빌드 되면 자식 위젯도 리빌드 된다
class SharedCounter extends InheritedWidget {
  // ShareCounter가 리빌드 될 수 있도록 부모의 상태를 외부로 노출시켜야 한다
  final CounterWidgetState state;

  const SharedCounter({super.key, required this.state, required super.child});

  @override
  bool updateShouldNotify(covariant SharedCounter oldWidget) {
    // SharedCounter가 리빌드 될 때 BuildContext에 있는 SharedCounter와,
    // 부모에 의해 새롭게 생긴 SharedCounter가 무엇이 다른지 비교하여
    // SharedCounter를 dependOn하는 위젯들에게만 `didChangeDependencies`를 호출하여 리빌드 시킨다.
    return true;
  }

  static SharedCounter of(BuildContext context, {bool build = true}) {
    return build
        ? context.dependOnInheritedWidgetOfExactType<SharedCounter>()!
        : context.findAncestorWidgetOfExactType<SharedCounter>()!;
  }
}
