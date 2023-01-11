import 'package:riverpod/riverpod.dart';
import 'package:riverpod_base/models/post.dart';
import 'package:riverpod_base/services/post.service.dart';

final postListProvider = FutureProvider.autoDispose((_) {
  return PostService().getPostList();
});

final postProvider =
    StateNotifierProvider.autoDispose<PostService, List<Post>>((ref) {
  return PostService();
});

final pageIndexProvider = StateProvider<int>((ref) => 2);

final canGoToPreviousPageProvider = Provider<bool>((ref) {
  return ref.watch(pageIndexProvider) != 0;
});

final canGoToForwardPageProvider = Provider<bool>((ref) {
  return ref.watch(pageIndexProvider) != 4;
});
