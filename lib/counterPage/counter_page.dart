
import 'package:counter_state_management/provider/counter_provider.dart';
import 'package:counter_state_management/state/multi_provider.dart';
import 'package:counter_state_management/state/provider_builder.dart';
import 'package:flutter/material.dart';


class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the CounterProvider instance to call its methods
    final counterProvider = MultiProvider.of(context)!.providers[CounterProvider] as CounterProvider;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom State Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Counter Number',
            ),
            // This builder will rebuild whenever the counter changes
            ProviderBuilder<CounterProvider, int>(
              builder: (context, value) {
                return Text(
                  '$value',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => counterProvider.increment(), // here we call the method without the imlementation of the logic making it highly decoupled for easy testing
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              onPressed: () => counterProvider.decrement(), // here we go again calling the metthod for decrement
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}