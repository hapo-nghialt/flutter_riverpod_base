import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_base/core/constants/api_constants.dart';
import 'package:riverpod_base/models/post.dart';

class PostService extends StateNotifier<List<Post>> {
  PostService() : super([]);

  final url = ApiConstants.apiUrl;
  Future<List<Post>> getPostList() async {
    Response response = await Dio().get('$url/posts');

    if (response.statusCode == 200) {
      List<Post> posts = [];
      for (var item in response.data) {
        posts.add(Post.fromJson(item));
      }
      // posts = response.data.map((item) {
      //   return Post.fromJson(item);
      // }).toList();
      return posts;
    } else {
      throw Exception("error api");
    }
  }

  Future<Response> addPost(title, body) async {
    final response =
        await Dio().post('$url/posts', data: {'title': title, 'body': body});
    return response;
  }

  Future<Response> deletePost(id) async {
    final response = await Dio().delete('$url/posts/$id');
    return response;
  }
}
