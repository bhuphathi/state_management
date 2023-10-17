// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Role {
  anonymous,
  admin,
  owner,
  manager,
  supervisor,
}

class User {
  final String name;
  final int age;
  final Role role;
  User({
    required this.name,
    required this.age,
    required this.role,
  });

  User copyWith({
    String? name,
    int? age,
    Role? role,
  }) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
      'role': role.toString(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      age: map['age'] as int,
      role: Role.values.firstWhere((e) => e.toString() == map["role"])
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(name: $name, age: $age, role: $role)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.age == age &&
      other.role == role;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode ^ role.hashCode;
}

class UserNotifier extends StateNotifier<User> {
  UserNotifier(super.state);

  void updateName(String value) {
    state = state.copyWith(name: value);
  }

  void updateAge(int value) {
    state = state.copyWith(age: value);
  }

  void updateRole(Role value) {
    state = state.copyWith(role: value);
  }
}

final userNotifierProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier(User(name: "", age: 0, role: Role.anonymous));
});
