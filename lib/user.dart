import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  final String name;
  final int age;
  User({
    required this.name,
    required this.age,
  });

  User copyWith({
    String? name,
    int? age,
  }) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'age': age});

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      age: map['age']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(name: $name, age: $age)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.name == name && other.age == age;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}

class UserNotifier extends StateNotifier<User> {
  UserNotifier(super.state);

  void updateName(String value) {
    state = state.copyWith(name: value);
  }

  void updateAge(int value) {
    state = state.copyWith(age: value);
  }
}

final userNotifierProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier(User(name: "", age: 0));
});
