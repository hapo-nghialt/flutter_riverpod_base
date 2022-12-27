import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_base/services/photo_service.dart';
import 'package:intl/intl.dart';

final photoProvider = FutureProvider.autoDispose((_) {
  final photoService = PhotoService.instance;
  return photoService.getPhotos();
});

final myStreamProvider = StreamProvider((ref) => Stream.periodic(const Duration(seconds: 1), (int count) {
      DateTime date = DateTime.now();
      String result = DateFormat('HH:mm:ss').format(date);
      print(result);
      return result;
    }));
