import 'package:flutter/material.dart';
import 'package:solace_flowz/solace_flowz.dart';

class SolaceFlowzConsumer<T> extends StatelessWidget {
  final Widget Function(BuildContext context, SolaceFlowz<T> solaceFlowz) builder;
  final Widget child;

  const SolaceFlowzConsumer({
    Key? key,
    required this.builder,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final solaceFlowz = SolaceFlowz.of<T>(context, true);
    return builder(context, solaceFlowz as SolaceFlowz<T>);
  }
}