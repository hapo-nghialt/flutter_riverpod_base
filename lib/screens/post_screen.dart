import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_base/providers/post.provider.dart';
import 'package:riverpod_base/screens/form_add_post.dart';
import 'package:riverpod_base/screens/form_update_post.dart';

class PostScreen extends ConsumerStatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostScreenState();
}

class _PostScreenState extends ConsumerState<PostScreen> {
  @override
  Widget build(BuildContext context) {
    final postListData = ref.watch(postListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post List"),
        actions: <Widget>[
          TextButton(
            onPressed: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FormAddPost()))
            },
            child: const Text(
              'Add',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Center(
        child: postListData.when(
          data: (data) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(data[index].title),
                  subtitle: Text(data[index].body),
                  tileColor:
                      index % 2 == 0 ? Colors.amber[100] : Colors.green[100],
                  trailing: TextButton(
                    onPressed: () {
                      ref
                          .read(postProvider.notifier)
                          .deletePost(data[index].id);
                    },
                    child: const Text("Delete"),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FormUpdatePost(id: data[index].id)), );
                  },
                );
              },
            );
          },
          error: (error, stack) => Text(error.toString()),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
