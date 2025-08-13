import '../state/base_provider.dart'; 

class CounterProvider extends BaseProvider<int> { //similary we wil have other providers for the app
  CounterProvider() : super(0);

  void increment() {
    value++;
  }

  void decrement() {
      value--;
  }
}
