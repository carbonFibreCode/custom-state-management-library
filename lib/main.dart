import 'package:counter_state_management/counterPage/counter_page.dart';
import 'package:counter_state_management/appState/App_state.dart';
import 'package:counter_state_management/state/multi_provider.dart';
import 'package:flutter/material.dart';

void main() {//here we will declare the providers in multiprovers from the Mapping stored in appstate,
  runApp(MultiProvider(providers: AppState().providers, child: const MyApp()));
} //this mapping can later be accessed by using calling static of() method of Mulptiproviders, using the concept dependOnInheritedWidgetOfExactType

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Counter App', home: CounterPage());
  }
}
