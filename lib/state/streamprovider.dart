import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProviderTest = StreamProvider((ref) async* {
  // return FirebaseFirestore.collection('users').doc(userId).snapshots();
  int i = 0;
  while (i < 100) {
    yield i;
    i++;
    await Future.delayed(const Duration(milliseconds: 150));
  }
});
