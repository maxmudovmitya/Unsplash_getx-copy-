import 'package:get/get.dart';
import '../models/collection_model.dart';
import '../services/http_service.dart';
import '../services/log_service.dart';
import '../pages/photos_page.dart';

class CollectionController extends GetxController {
  bool isLoading = false;
  List<Collection> items = [];

  void apiCollectionList() async {
    isLoading = true;
    update();

    var response = await Network.GET(
        Network.API_COLLECTIONS, Network.paramsCollections(1));
    if (response != null) {
      items = Network.parseCollections(response);
      LogService.i(items.length.toString());
    }

    isLoading = false;
    update();
  }


}
