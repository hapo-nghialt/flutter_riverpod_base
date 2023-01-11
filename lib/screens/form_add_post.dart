import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_base/providers/post.provider.dart';

class FormAddPost extends ConsumerStatefulWidget {
  const FormAddPost({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FormAddPostState();
}

class _FormAddPostState extends ConsumerState<FormAddPost> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Form add Post"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                  hintText: "Title", border: OutlineInputBorder()),
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
              onPressed: () => {
                ref
                    .read(postProvider.notifier)
                    .addPost(_titleController.text, _bodyController.text),
              },
              child: const Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}
