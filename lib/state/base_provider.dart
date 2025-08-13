import 'value_notifier.dart';

abstract class BaseProvider<T> { //this is our abstract wrapper class around to value notifier for accesing and managing the value notifier 
  final ValueNotifier<T> _notifier; //we will not directly manipulate the value notifier instance instead we access them via this class and hence keeping it's implementations abstracted and hidden

  BaseProvider(T initialValue) : _notifier = ValueNotifier<T>(initialValue);

  ValueNotifier<T> get notifier => _notifier;

  T get value => _notifier.value;
  set value(T newValue) => _notifier.value = newValue;

  void dispose() => _notifier.dispose();
}
