import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:riverpod_base/providers/photo_provider.dart';

final counterProvider = StateProvider((ref) => '0');

class TimeScreen extends ConsumerWidget {
  const TimeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataStreams = ref.watch(myStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Streams'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            dataStreams.when(
              data: (data) => Text(
                data,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
