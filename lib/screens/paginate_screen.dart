import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_base/providers/post.provider.dart';

class PaginateScreen extends ConsumerWidget {
  const PaginateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(pageIndexProvider.notifier);
    final canGotoPreviousPage = ref.watch(canGoToPreviousPageProvider);
    final canGotoForwardPage = ref.watch(canGoToForwardPageProvider);

    void goToPreviousPage() {
      ref.read(pageIndexProvider.notifier).update((state) => state - 1);
    }

    void goToForwardPage() {
      ref.read(pageIndexProvider.notifier).update((state) => state + 1);
    }

    final filterAnimalData = ref.watch(filterAnimalList);

    print('rebuild widget');
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: canGotoPreviousPage ? goToPreviousPage : null,
                child: const Text("Previous"),
              ),
              const SizedBox(width: 5,),
              Text('${pageIndex.state}'),
              const SizedBox(width: 5,),
              TextButton(
                onPressed: canGotoForwardPage ? goToForwardPage : null,
                child: const Text("Forward"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
