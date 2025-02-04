import 'package:get/get.dart';
import 'package:ngdemo16/models/photo_model.dart';
import 'package:ngdemo16/services/http_service.dart';
import 'package:ngdemo16/services/log_service.dart';

class PhotosController extends GetxController {
  List<Photo> items = [];
  bool isLoading = false;

  Future<void> apiCollectionPhotos(String collectionId) async {
    isLoading = true;
    update();

    var response = await Network.GET(
      Network.API_COLLECTIONS_PHOTOS.replaceFirst(":id", collectionId),
      Network.paramsCollectionsPhotos(1),
    );
    List<Photo> photos = Network.parseCollectionsPhotos(response!);
    LogService.i(photos.length.toString());

    items = photos;
    isLoading = false;
    update();
  }

}
