import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_base/providers/post.provider.dart';

class FormUpdatePost extends ConsumerStatefulWidget {
  final String id;
  const FormUpdatePost({Key? key, required this.id})
      : super(
          key: key,
        );

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FormUpdatePostState();
}

class _FormUpdatePostState extends ConsumerState<FormUpdatePost> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final postDetailData = ref.watch(postDetailProvider(widget.id));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Form update"),
      ),
      body: postDetailData.when(
        data: (data) {
          _titleController.text = data.title;
          _bodyController.text = data.body;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    hintText: "Title",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: _bodyController,
                  decoration: const InputDecoration(
                    hintText: "Body",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextButton(
                    onPressed: () {
                      ref.read(postProvider.notifier).updatePost(widget.id,
                          _titleController.text, _bodyController.text);
                    },
                    child: const Text("Update"))
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          return Text('$error');
        },
        loading: () {
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
