import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_base/providers/post.provider.dart';
import 'package:riverpod_base/screens/form_add_post.dart';

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
                  return Container(
                    height: 50,
                    color:
                        index % 2 == 0 ? Colors.amber[100] : Colors.green[100],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(data[index].title),
                              Text(data[index].body),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              ref
                                  .read(postProvider.notifier)
                                  .deletePost(data[index].id);
                            },
                            child: const Text("Delete"),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
          error: (error, stack) => Text(error.toString()),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
