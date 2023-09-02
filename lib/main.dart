import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/widget/provider.dart';
import 'package:state_management/widget/statenotifier_provider.dart';
import 'package:state_management/widget/state_provider.dart';

//Provider
//StateProvider : for primitive values
//StateNotifier & StateNotifierProvider : for objects

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'State Management Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.lime, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var pageName;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Text("nothing to display");
    Widget floatingBtn = const Text("");
    var title = 'State Management Demo Home Page';

    if (pageName == "normal") {
      content = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      );
      floatingBtn = FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      );
    }

    if (pageName == "provider") {
      content = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      );
    } else if (pageName == "stateprovider") {
      content = const StateProviderWidget();
    } else if (pageName == "providerstate") {
      content = const ProviderWidget();
    } else if (pageName == "statenotifier") {
      content = const StateNotifierProviderWidget();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            TextButton(
              child: const Column(
                children: [
                  Icon(Icons.deblur),
                  Text("Default State"),
                ],
              ),
              onPressed: () {
                setState(() {
                  pageName = "normal";
                });
              },
            ),
            TextButton(
              child: const Column(
                children: [
                  Icon(Icons.ac_unit),
                  Text("Provider State"),
                ],
              ),
              onPressed: () {
                setState(() {
                  pageName = "providerstate";
                });
              },
            ),
            TextButton(
              child: const Column(
                children: [
                  Icon(Icons.favorite),
                  Text("State Provider"),
                ],
              ),
              onPressed: () {
                setState(() {
                  pageName = "stateprovider";
                });
              },
            ),
            TextButton(
              child: const Column(
                children: [
                  Icon(Icons.favorite),
                  Text("State Notifier"),
                ],
              ),
              onPressed: () {
                setState(() {
                  pageName = "statenotifier";
                });
              },
            ),
          ],
        ),
      ),
      body: content,
      floatingActionButton: floatingBtn,
    );
  }
}
