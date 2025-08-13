import 'package:flutter/material.dart' hide ValueNotifier;
import 'value_notifier.dart';

class ValueBuilder<T> extends StatelessWidget {
  //base class that listens to the changes in the value notifier and reacts to it
  const ValueBuilder({
    super.key,
    required this.notifier,
    required this.builder,
  });

  final ValueNotifier<T> notifier;
  final Widget Function(BuildContext context, T value) builder;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<T>(
      valueListenable: notifier,
      builder: (context, value, child) {
        return builder(context, value);
      },
    );
  }
}
