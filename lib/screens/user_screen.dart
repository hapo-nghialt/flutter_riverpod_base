import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_base/providers/user_provider.dart';
import 'package:riverpod_base/screens/form_add_user.dart';

class UserScreen extends ConsumerWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userApiProvider = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
        actions: [
          TextButton(
            onPressed: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FormAddUser()))
            },
            child: const Text(
              'Add',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Center(
        child: userApiProvider.when(
          data: (data) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  height: 50,
                  color: data[index].id % 2 == 0
                      ? Colors.green[200]
                      : Colors.amber[200],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data[index].username),
                      Text(data[index].email),
                    ],
                  ),
                );
              },
            );
          },
          error: (_, __) => const Text('error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
