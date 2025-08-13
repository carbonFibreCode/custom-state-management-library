import 'package:flutter/material.dart';
import 'base_provider.dart'; 

class MultiProvider extends InheritedWidget {
  final Map<Type, BaseProvider> providers; //multiprovider holds the mapping of the typed baseproviders

  const MultiProvider({
    super.key,
    required this.providers,
    required super.child,
  });

  static MultiProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MultiProvider>();
  }

  @override
  bool updateShouldNotify(MultiProvider oldWidget) {
    return providers != oldWidget.providers;
  }
}
