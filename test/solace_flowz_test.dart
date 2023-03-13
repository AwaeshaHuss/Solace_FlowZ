import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solace_flowz/solace_flowz.dart';

void main() {
  testWidgets('SolaceFlowz updates state correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      SolaceFlowz<int>(
        value: 0,
        builder: (context, value, child) {
          return Text(value.toString());
        },
      ),
    );

    expect(find.text('0'), findsOneWidget);

    await tester.pumpWidget(
      SolaceFlowz<int>(
        value: 42,
        builder: (context, value, child) {
          return Text(value.toString());
        },
      ),
    );

    expect(find.text('42'), findsOneWidget);
  });
}
