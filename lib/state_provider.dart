import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = StateProvider<String>((ref) {
  return 'default';
});

class StateProviderWidget extends ConsumerWidget {
  const StateProviderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(nameProvider);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer(
              builder: (context, ref, child) {
                final name = ref.read(nameProvider);
                return Text("from Consumer provider widget: $name");
              },
            ),
            const SizedBox(height: 10),
            const Text('Theme Name Provider:'),
            const SizedBox(height: 10),
            Text(
              state,
              style: const TextStyle(color: Colors.amber),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Test Here',
              ),
              onChanged: (value) {
                ref.read(nameProvider.notifier).update((state) => value);
              },
            )
          ],
        ),
      ),
    );
  }
}
