import 'dart:math' as math;

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/**
 * State + InheritedWidget/InheritedModel은 State의 `setState() 메소드`를 통해
 * 플러터에게 InheritedWidget/InheritedModel를 리빌드하게 시켜
 * dependOnInheritedWidgetOfExactType를 통해 InheritedWidget/InheritedModel에
 * 의존하고 있는 위젯들을 리빌드하였다면,
 * InheritedNotifier 옵저버 패턴을 사용하여 dependOnInheritedWidgetOfExactType를 하는데 그 방식은 아래와 같다.
 * 1. 상태를 관리하는 Listenable(=Observable) 컴포넌트에 이하 소스와 같은 리스너(_handleUpdate())를 등록시킨다
 *  <pre>
 *  <code>
 *  void _handleUpdate() {
 *    _dirty = true;
 *    markNeedsBuild();
 *  }
 *  </code>
 *  </pre>
 *
 * 2. 상태를 관리하는 Listenable(=Observable)의 상태가 바뀌었다면 자신에게 등록되어있는 리스너들의 콜백 메소드를 모두 호출한다.
 * 3. Listenable(=Observable)로부터 콜백 메소드를 호출당한 InheritedNotifier(=Observer)는 _handleUpdate()가 호출되었으므로
 *    플러터 프레임워크에서 리빌드한다.
 * 4. InheritedNotifier(=Observer)가 리빌드 되었음으로 dependOnInheritedWidgetOfExactType를 통해 InheritedNotifier(=Observer)를
 *    참조하고 있던 위젯들은 didChangedDependencies()가 호출되고 state가 dirty 상태가 되므로 리빌드 된다.
 */
class SpinModel extends InheritedNotifier<AnimationController> {
  const SpinModel({
    Key? key,
    AnimationController? notifier,
    required Widget child,
  }) : super(key: key, notifier: notifier, child: child);

  static double of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SpinModel>()!.notifier!.value;
  }
}

class Spinner extends StatelessWidget {
  const Spinner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('${this.runtimeType} is under building');
    return Transform.rotate(
      angle: SpinModel.of(context) * 2.0 * math.pi,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.green,
        child: const Center(
          child: Text('Whee!'),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _MyStatefulWidgetState extends State<MyStatefulWidget> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('${this.runtimeType} is under building');
    return SpinModel(
      notifier: _controller,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const <Widget>[
          Spinner(),
          Spinner(),
          Spinner(),
        ],
      ),
    );
  }
}
