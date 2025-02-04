import 'package:get/get.dart';
import 'package:ngdemo16/models/photo_model.dart';
import 'package:ngdemo16/services/http_service.dart';
import 'package:ngdemo16/services/log_service.dart';
import '../models/search_photos_res.dart';

class SearchsController extends GetxController {
  var isLoading = false;
  var items = <Photo>[];

  void apiSearchPhotos() async {
    isLoading = true;
    update();

    var response = await Network.GET(
        Network.API_SEARCH_PHOTOS, Network.paramsSearchPhotos("unsplash", 1));
    SearchPhotosRes searchPhotosRes = Network.parseSearchPhotos(response!);
    LogService.i(searchPhotosRes.results.length.toString());

    items.addAll(searchPhotosRes.results);
    isLoading = false;
    update();
  }
}
