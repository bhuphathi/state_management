import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:state_management/state/user_statenotifier.dart';

final fetchFutureProvider = FutureProvider((ref) {
  final url = Uri.parse("http://jsonplaceholder.typicode.com/users/1");
  return http.get(url).then((value) => User.fromJson(value.body));
});

// final fetchFutureProvider = FutureProvider.autoDispose((ref) {
//   final url = Uri.parse("http://jsonplaceholder.typicode.com/users/1");
//   return http.get(url).then((value) => User.fromJson(value.body));
// });

// final fetchFutureProvider = FutureProvider.autoDispose((ref) {
//   ref.keepAlive();
//   ref.onDispose(() {});
//   ref.onCancel(() {});
//   ref.onResume(() {});
//   final url = Uri.parse("http://jsonplaceholder.typicode.com/users/1");
//   return http.get(url).then((value) => User.fromJson(value.body));
// });
