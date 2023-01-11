import 'package:flutter/material.dart';
import 'package:riverpod_base/screens/paginate_screen.dart';
import 'package:riverpod_base/screens/post_screen.dart';
import 'package:riverpod_base/screens/user_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserScreen()),
                );
              },
              child: const Text('Click'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PostScreen()),
                );
              },
              child: const Text('Post List'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaginateScreen()),
                );
              },
              child: const Text('Paginate Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
