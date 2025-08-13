import 'package:flutter/material.dart';
import 'multi_provider.dart'; 
import 'value_builder.dart'; 
import 'base_provider.dart'; 

class ProviderBuilder<T extends BaseProvider<U>, U> extends StatelessWidget {
//we have this class to access the providers of type BaseProviders,
//and return the ValueBuilder widget which returns the valueListenableBuilder
//with value argument in the builder
  final Widget Function(BuildContext context, U value) builder;

  const ProviderBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    final multiProvider = MultiProvider.of(context);
    if (multiProvider == null) {
      throw Exception('No MultiProvider found in context');
    }
    final provider = multiProvider.providers[T] as T?;
    if (provider == null) {
      throw Exception('Provider $T not found');
    }
    return ValueBuilder<U>(
      notifier: provider.notifier,
      builder: (context, value) => builder(context, value),
    );
  }
}
