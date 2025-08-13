import '../state/base_provider.dart'; 
import '../provider/counter_provider.dart'; 

class AppState { //this class will hold all the providers of the application
  static final AppState _instance = AppState._();
  factory AppState() => _instance;
  AppState._();

  final Map<Type, BaseProvider> providers = {
    CounterProvider: CounterProvider(),

  };

  void dispose() {
    for (var provider in providers.values) {
      provider.dispose();
    }
  }
}
