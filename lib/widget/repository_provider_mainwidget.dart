import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/state/userno_stateprovider.dart';
import 'package:state_management/widget/repository_provider_widget.dart';

class FutureRepositoryProviderMainWidget extends ConsumerStatefulWidget {
  const FutureRepositoryProviderMainWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FutureRepositoryProviderMainWidgetState();
}

class _FutureRepositoryProviderMainWidgetState
    extends ConsumerState<FutureRepositoryProviderMainWidget> {
  String userNo = "1";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              initialValue: userNo,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Type an Int Here',
              ),
              onChanged: (value) {
                setState(() {
                  userNo = value;
                });
                ref.read(userNoProvider.notifier).update((state) => value);
              },
            ),
            FutureRepositoryProviderWidget(
              userNo: userNo,
            )
          ],
        ),
      ),
    );
  }
}
