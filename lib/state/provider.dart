//state can't be changed only access via ref.read, ref.watch or Consumer(builder: (context, ref, child) {ref.watch return Widget})
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stringProvider = Provider<String>((ref) {
  return "string provider test";
});

final intProvider = Provider<int>((ref) {
  return 12;
});
