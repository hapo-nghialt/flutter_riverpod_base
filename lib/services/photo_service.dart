import 'package:dio/dio.dart';
import 'package:riverpod_base/core/constants/api_constants.dart';
import 'package:riverpod_base/models/photo.dart';
import 'package:riverpod_base/models/user.dart';

class PhotoService {
  PhotoService._();

  static final instance = PhotoService._();

  final url = ApiConstants.PHOTO_API;

  Future<List<Photo>> getPhotos() async {
    final response = await Dio().get(url);
    final data = response.data;
    List<Photo> photos = response.statusCode == 200
        ? data.map<Photo>((c) {
            return Photo.fromJson(c);
          }).toList()
        : [];
    return photos;
  }
}
