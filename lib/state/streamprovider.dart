import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProviderTest = StreamProvider((ref) async* {
  // return FirebaseFirestore.collection('users').doc(userId).snapshots();
  yield [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
});
