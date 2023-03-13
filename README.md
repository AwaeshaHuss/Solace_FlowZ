# SolaceFlowz

<img src="https://raw.githubusercontent.com/AwaeshaHuss/Solace_FlowZ/main/Solace_FlowZ.png" alt="Example image" width="250" height="115">

**SolaceFlowz is a simple state management package for Flutter based on the InheritedWidget and StatefulWidget classes.**

## Installation

Add the following line to your pubspec.yaml file:
`
dependencies:
  solace_flowz: ^1.0.0
`

## Usage

1. Wrap your widget tree with a SolaceFlowz widget:

```

SolaceFlowz(
  value: myValue,
  builder: (BuildContext context, int value, Widget child) {

    // Return a widget that depends on the value.
  },
  child: MyChildWidget(),
)

```

2. Use the SolaceFlowz.of static method to access the value from any child widget:
`
int myValue = SolaceFlowz.of<int>(context);
`

3. Update the value by calling the setState method on the SolaceFlowz widget:

`
SolaceFlowz.of<int>(context).setState(() {
  SolaceFlowz.of<int>(context).value = 42;
});
`

- You can use this SolaceFlowzConsumer widget in a similar way to the Consumer widget provided by the provider package, by wrapping your widgets with the SolaceFlowz<T> widget, and using the SolaceFlowzConsumer<T> widget to consume data from the SolaceFlowz<T> instance. Here's an example usage:

```

SolaceFlowz<MyData>(
  builder: (context, solaceFlowz) => SolaceFlowzConsumer<MyData>(
    builder: (context, data) {
      // Use the MyData object to build your widget tree
      return Text(data.toString());
    },
    child: MyWidget(),
  ),
);


```

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

### GitHub Repository

**The source code for My Package is available on GitHub at [GitHub Repo](https://github.com/AwaeshaHuss/Solace_FlowZ.git).**

You can clone the repository using the following command:

`
git clone https://github.com/AwaeshaHuss/Solace_FlowZ.git
`

### License

**In this example, we have created a section specifically for the GitHub repository, provided a brief** **description of the package, and included a link to the GitHub repository using markdown syntax. We** **have also mentioned the license and provided instructions on how to clone the repository and report issues.**
