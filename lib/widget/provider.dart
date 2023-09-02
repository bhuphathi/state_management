import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/state/provider.dart';

class ProviderWidget extends ConsumerStatefulWidget {
  const ProviderWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProviderWidgetState();
}

class _ProviderWidgetState extends ConsumerState<ProviderWidget> {
  var intState = 0;

  @override
  Widget build(BuildContext context) {
    final stringState = ref.watch(stringProvider);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('immutable Provider:'),
          Text(
            stringState,
            style: const TextStyle(color: Colors.amber),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    intState = ref.read(intProvider);
                  });
                },
                child: Text("ref.read(intProvider) $intState"),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    intState = 0;
                  });
                },
                child: const Text("Reset"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
