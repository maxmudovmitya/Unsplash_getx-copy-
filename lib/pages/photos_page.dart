import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ngdemo16/models/collection_model.dart';

import '../controller/photos_controller.dart';
import '../models/photo_model.dart';
import '../services/http_service.dart';
import '../services/log_service.dart';
import 'details_page.dart';

class PhotosPage extends StatefulWidget {
  final Collection? collection;

  const PhotosPage({super.key, this.collection});

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {

  final PhotosController controller = Get.put(PhotosController());


  @override
  void initState() {
    super.initState();
    controller.apiCollectionPhotos(widget.collection!.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.collection!.title,
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: GetBuilder<PhotosController>(
        builder: (controller) {
          return  Stack(
            children: [
              MasonryGridView.builder(
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: controller.items.length,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                itemBuilder: (context, index) {
                  return _itemOfPhoto(controller.items[index], index);
                },
              ),
              controller.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : SizedBox.shrink(),
            ],
          );
        }
      )
    );
  }

  Widget _itemOfPhoto(Photo photo, int index) {
    return GestureDetector(
        onTap: () {
          Get.to(DetailsPage(photo: photo));         },
        child: Stack(
          children: [
            Container(
              height: (index % 5 + 5) * 50.0,
              child: CachedNetworkImage(
                imageUrl: photo.urls.small,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              height: (index % 5 + 5) * 50.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    maxLines: 2,
                    photo.description ?? "No name",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
