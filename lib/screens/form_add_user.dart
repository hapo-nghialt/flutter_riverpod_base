import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_base/providers/user_provider.dart';

class FormAddUser extends ConsumerStatefulWidget {
  // const FormAddUser({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FormAddUserState();
}

class _FormAddUserState extends ConsumerState<FormAddUser> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Form add User"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _userNameController,
              decoration: const InputDecoration(
                  hintText: "Username", border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                  hintText: "Email", border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 5,
            ),
            TextButton(
              onPressed: () => {
                ref
                    .read(userCreateProvider.notifier)
                    .addUser(_userNameController.text, _emailController.text)
              },
              child: const Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}
