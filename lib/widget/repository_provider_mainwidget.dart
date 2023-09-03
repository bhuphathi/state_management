import 'package:flutter/material.dart';
import 'package:state_management/widget/repository_provider_widget.dart';

class FutureRepositoryProviderMainWidget extends StatefulWidget {
  const FutureRepositoryProviderMainWidget({Key? key}) : super(key: key);

  @override
  State createState() => _FutureRepositoryProviderMainWidgetState();
}

class _FutureRepositoryProviderMainWidgetState
    extends State<FutureRepositoryProviderMainWidget> {
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
