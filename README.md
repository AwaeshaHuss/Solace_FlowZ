# SolaceFlowz

<img src="https://github.com/AwaeshaHuss/Solace_FlowZ/blob/main/Solace_FlowZ.png" alt="Example image" width="250" height="115">





**SolaceFlowz is a simple state management package for Flutter based on the InheritedWidget and StatefulWidget classes.**

## Installation

Add the following line to your pubspec.yaml file:
`
dependencies:
  solace_flowz: ^1.0.0
`
## Usage

1. Wrap your widget tree with a SolaceFlowz widget:

`
SolaceFlowz(
  value: myValue,
  builder: (BuildContext context, int value, Widget child) {
    // Return a widget that depends on the value.
  },
  child: MyChildWidget(),
)
`

2. Use the SolaceFlowz.of static method to access the value from any child widget:
`
int myValue = SolaceFlowz.of<_int_>(context);
`

3. Update the value by calling the setState method on the SolaceFlowz widget:

`
SolaceFlowz.of<_int_>(context).setState(() {
  SolaceFlowz.of<_int_>(context).value = 42;
});
`

### Example

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
### License

**This package is released under the MIT License. See LICENSE for details.**
