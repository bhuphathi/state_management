import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/state/streamprovider.dart';

class StreamProviderWidget extends ConsumerWidget {
  const StreamProviderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // return ref.watch(fetchFutureProvider).map(data: data, error: error, loading: loading)
    // return ref.watch(fetchFutureProvider).whenData((value) => null)
    return ref.watch(streamProviderTest).when(
          data: (data) {
            return Center(
              child: Text("Futureprovider data: ${data.toString()}"),
            );
          },
          error: (error, stackTrace) {
            return Center(child: Text(error.toString()));
          },
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}
