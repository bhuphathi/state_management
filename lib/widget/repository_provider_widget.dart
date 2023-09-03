import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/model/user_repository.dart';

class FutureRepositoryProviderWidget extends ConsumerStatefulWidget {
  const FutureRepositoryProviderWidget({super.key, required this.userNo});

  final String userNo;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FutureProviderWidgetState();
}

class _FutureProviderWidgetState
    extends ConsumerState<FutureRepositoryProviderWidget> {
  @override
  Widget build(BuildContext context) {
    // return ref.watch(fetchFutureProvider).map(data: data, error: error, loading: loading)
    // return ref.watch(fetchFutureProvider).whenData((value) => null)
    return ref.watch(futureUserRepositoryProvider(widget.userNo)).when(
          data: (data) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                  "userNo: ${widget.userNo}, http Fetched Futureprovider data: ${data.name}"),
            );
          },
          error: (error, stackTrace) {
            return Center(child: Text(error.toString()));
          },
          loading: () => const CircularProgressIndicator(),
        );
  }
}
