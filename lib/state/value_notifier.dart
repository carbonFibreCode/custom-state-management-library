import 'package:flutter/foundation.dart';

class ValueNotifier<T> implements ValueListenable<T> {
  //base class to hold the dynamic data that need the action reaction functionality
  // to make widgets react to it, it overrides the valueListenable metthods and
  //acts exaclty the same way
  T _value;
  final List<VoidCallback> _listeners = [];

  ValueNotifier(this._value);

  @override
  T get value => _value;

  set value(T newValue) {
    if (_value == newValue) return;
    _value = newValue;
    _notifyListeners();
  }

  @override
  void addListener(VoidCallback listener) => _listeners.add(listener);

  @override
  void removeListener(VoidCallback listener) => _listeners.remove(listener);

  void _notifyListeners() {
    for (final listener in List<VoidCallback>.from(_listeners)) {
      listener();
    }
  }

  void dispose() {
    _listeners.clear();
  }
}
