import 'package:flutter/material.dart';

typedef SolaceFlowzBuilder<T> = Widget Function(
  BuildContext context,
  T value,
  Widget child,
);

class SolaceFlowz<T> extends StatefulWidget {
  final T value;
  final Widget? child;
  final SolaceFlowzBuilder<T> builder;

  const SolaceFlowz({
    Key? key,
    required this.value,
    required this.builder,
    this.child,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SolaceFlowzState<T> createState() => _SolaceFlowzState<T>();

  static T of<T>(BuildContext context, bool listen) {
    final SolaceFlowz<T>? provider =
        context.findAncestorWidgetOfExactType<SolaceFlowz<T>>();
    if (provider == null) {
      throw FlutterError(
          'SolaceFlowz<$T> not found. Make sure to wrap your widget tree '
          'with a SolaceFlowz<$T>.');
    }
    (listen)
        ? WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            (context as Element).markNeedsBuild();
          })
        : null;
    return provider.value;
  }
}

class _SolaceFlowzState<T> extends State<SolaceFlowz<T>> {
  T? value;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  void didUpdateWidget(SolaceFlowz<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      setState(() {
        value = widget.value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InheritedSolaceFlowz<T>(
      value: value as T,
      builder: widget.builder,
      child: widget.child ?? const SizedBox(),
    );
  }
}

class InheritedSolaceFlowz<T> extends InheritedWidget {
  final T value;
  final SolaceFlowzBuilder<T> builder;

  const InheritedSolaceFlowz({
    Key? key,
    required this.value,
    required this.builder,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedSolaceFlowz<T> oldWidget) {
    return value != oldWidget.value;
  }

  InheritedSolaceFlowz<T> cloneWithChild(Widget child) {
    return InheritedSolaceFlowz<T>(
      key: key,
      value: value,
      builder: builder,
      child: child,
    );
  }
}
