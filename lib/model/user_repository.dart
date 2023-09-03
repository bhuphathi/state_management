import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:state_management/state/user_statenotifier.dart';

final futureUserRepositoryProvider = FutureProvider.family((ref, String input) {
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.fetchUserData(input);
});

final userRepositoryProvider = Provider((ref) => UserRepository());

class UserRepository {
  // final String userno;
  // UserRepository(this.userno);

  Future<User> fetchUserData(String input) {
    var userNo = input.isEmpty ? "1" : input;
    var url = "https://jsonplaceholder.typicode.com/users/$userNo";
    return http.get(Uri.parse(url)).then((value) => User.fromJson(value.body));
  }
}
