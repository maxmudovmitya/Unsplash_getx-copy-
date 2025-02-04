import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngdemo16/pages/photos_page.dart';
import '../controller/collection_controller.dart';
import '../models/collection_model.dart';

class CollectionPage extends StatefulWidget {
  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  final CollectionController controller = Get.put(CollectionController());

  // void callPhotosPage(Collection collection) {
  //   Get.to(() => PhotosPage(collection: collection));
  // }

  @override
  void initState() {
    super.initState();
    controller.apiCollectionList();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CollectionController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              ListView.builder(
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  return _itemOfCollection(controller, controller.items[index]);
                },
              ),
              if (controller.isLoading)
                Center(child: CircularProgressIndicator()),
            ],
          ),
        );
      },
    );
  }

  Widget _itemOfCollection(CollectionController controller, Collection collection) {
    return GestureDetector(
      onTap: () => Get.to(() => PhotosPage(collection: collection)),
      child: Container(
        width: double.infinity,
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: collection.coverPhoto.urls.small,
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
            Container(
              padding: EdgeInsets.all(16),
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    collection.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
