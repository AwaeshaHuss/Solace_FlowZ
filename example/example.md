# Example

Here's a simple example that shows how to use SolaceFlowz to manage the state of a counter:

```

import 'package:flutter/material.dart';
import 'package:solace_flowz/solace_flowz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SolaceFlowz<int>(
        value: 0,
        builder: (BuildContext context, int value, Widget child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('SolaceFlowz Example'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Counter: $value'),
                  child,
                ],
              ),
            ),
          );
        },
        child: ElevatedButton(
          onPressed: () {
            SolaceFlowz.of<int>(context).setState(() {
              SolaceFlowz.of<int>(context).value += 1;
            });
          },
          child: Text('Increment'),
        ),
      ),
    );
  }
}
```