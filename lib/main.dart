import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/logger_riverpod.dart';
import 'package:state_management/widget/futureprovider_widget.dart';
import 'package:state_management/widget/provider.dart';
import 'package:state_management/widget/statenotifier_provider.dart';
import 'package:state_management/widget/state_provider.dart';
import 'package:state_management/widget/streamprovider_widget.dart';
import 'package:state_management/widget/repository_provider_mainwidget.dart';

//Provider
//StateProvider : for primitive values
//StateNotifier & StateNotifierProvider : for objects
//FutureProvider http request, async
//SreamProvider

// NotifierProvider (new in Riverpod 2.0)
// AsyncNotifierProvider (new in Riverpod 2.0)
// https://codewithandrea.com/articles/flutter-state-management-riverpod/

void main() {
  runApp(
    ProviderScope(
      observers: [LoggerRiverpod()],
      child: const MyApp(),
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
  final pageNames = [
    {"btnName": "Default State", "actionName": "normal"},
    {"btnName": "Provider", "actionName": "providerstate"},
    {"btnName": "State Provider", "actionName": "stateprovider"},
    {"btnName": "State Notifier", "actionName": "statenotifier"},
    {"btnName": "Future Provider", "actionName": "futureprovider"},
    {"btnName": "Stream Provider", "actionName": "streamprovider"},
    {"btnName": "Repository", "actionName": "repository"},
  ];
  var selectedPageName;

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

    if (selectedPageName == "normal") {
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
    if (selectedPageName == "providerstate") {
      content = const ProviderWidget();
    } else if (selectedPageName == "stateprovider") {
      content = const StateProviderWidget();
    } else if (selectedPageName == "statenotifier") {
      content = const StateNotifierProviderWidget();
    } else if (selectedPageName == "futureprovider") {
      content = const FutureProviderWidget();
    } else if (selectedPageName == "streamprovider") {
      content = const StreamProviderWidget();
    } else if (selectedPageName == "repository") {
      content = const FutureRepositoryProviderMainWidget();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 84,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8),
            itemCount: pageNames.length,
            itemBuilder: (BuildContext context, int index) {
              return TextButton(
                child: Text(pageNames[index]["btnName"]!),
                onPressed: () {
                  setState(() {
                    selectedPageName = pageNames[index]["actionName"];
                  });
                },
              );
            }),
      ),
      body: content,
      floatingActionButton: floatingBtn,
    );
  }
}
