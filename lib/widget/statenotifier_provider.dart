import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/state/user_statenotifier.dart';

class StateNotifierProviderWidget extends ConsumerWidget {
  const StateNotifierProviderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userNotifierProvider);
    // watch state for selected property or field in a state provider
    final userNameSelect =
        ref.watch(userNotifierProvider.select((value) => value.name));

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer(
              builder: (context, ref, child) {
                final name = ref.read(userNotifierProvider);
                return Text(
                    "from Consumer provider widget: ${name.name} ${name.age}");
              },
            ),
            const SizedBox(height: 10),
            Text("notifierProvider.select: $userNameSelect"),
            const SizedBox(height: 10),
            const Text('State Notifier:'),
            const SizedBox(height: 10),
            Text(
              state.name,
              style: const TextStyle(color: Colors.amber),
            ),
            const SizedBox(height: 10),
            Text(
              state.age.toString(),
              style: const TextStyle(color: Colors.amber),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
              onChanged: (value) {
                ref.read(userNotifierProvider.notifier).updateName(value);
              },
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Age',
              ),
              onChanged: (value) {
                ref
                    .read(userNotifierProvider.notifier)
                    .updateAge(int.parse(value));
              },
            ),
          ],
        ),
      ),
    );
  }
}
