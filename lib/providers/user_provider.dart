import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_base/models/user.dart';
import 'package:riverpod_base/services/user_service.dart';

final userProvider = FutureProvider.autoDispose((_) {
  // final userService = UserService.instance;
  return UserService().getUsers();
});

final userCreateProvider =
    StateNotifierProvider<UserService, List<User>>((ref) {
  return UserService();
});
