import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_base/providers/photo_provider.dart';

class FutureScreen extends ConsumerWidget {
  const FutureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataphoto = ref.watch(photoProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Future Provider'),
          elevation: 0,
        ),
        body: Center(
          child: dataphoto.when(
            data: (data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      ListTile(
                        title: TextButton(onPressed: () {}, child: Text(data[i].title.toString())),
                      ),
                      data[i].thumbnailUrl.isNotEmpty
                          ? Image.network(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRe5xJrGwCVXglXv9U0mxjA0ROxWeZlgQhyQ&usqp=CAU',
                              height: 96.0,
                              width: 96.0,
                              fit: BoxFit.cover,
                            )
                          : Container()
                    ],
                  );
                },
              );
            },
            error: (_, __) => const Text('error'),
            loading: () => const CircularProgressIndicator(),
          ),
        ));
  }
}
