import 'package:flutter/material.dart';
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
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UserScreen()),
            );
          },
          child: const Text('Click'),
        ),
      ),
    );
  }
}
