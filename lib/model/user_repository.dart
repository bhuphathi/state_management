import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:state_management/state/user_statenotifier.dart';
import 'package:state_management/state/userno_stateprovider.dart';

final futureUserRepositoryProvider = FutureProvider.family((ref, String input) {
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.fetchUserData(input);
});

// //without ref inside class
// final userRepositoryProvider = Provider((ref) => UserRepository());

// class UserRepository {
//   Future<User> fetchUserData(String input) {
//     var userNo = input.isEmpty ? "1" : input;
//     var url = "https://jsonplaceholder.typicode.com/users/$userNo";
//     return http.get(Uri.parse(url)).then((value) => User.fromJson(value.body));
//   }
// }


//use ref inside a class or function
final userRepositoryProvider = Provider((ref) => UserRepository(ref));

class UserRepository {
  final Ref ref;
  UserRepository(this.ref);

  Future<User> fetchUserData(String input) {
    var userNo = ref.watch(userNoProvider);
    userNo = userNo.isEmpty ? "1" : userNo;
    var url = "https://jsonplaceholder.typicode.com/users/$userNo";
    return http.get(Uri.parse(url)).then((value) => User.fromJson(value.body));
  }
}
