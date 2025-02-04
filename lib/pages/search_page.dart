import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ngdemo16/controller/search_controller.dart';
import 'package:ngdemo16/models/photo_model.dart';

import '../controller/photos_controller.dart';
import '../models/search_photos_res.dart';
import '../services/http_service.dart';
import '../services/log_service.dart';
import 'details_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchsController controller = Get.put(SearchsController());

  @override
  void initState() {
    super.initState();
    controller.apiSearchPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: GetBuilder<SearchsController>(builder: (controller) {
          return Stack(
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
        }));
  }

  Widget _itemOfPhoto(Photo photo, int index) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailsPage(photo: photo));
      },
      child: Stack(
        children: [
          Container(
              height: (index % 5 + 5) * 50.0,
              child: CachedNetworkImage(
                imageUrl: photo.urls.small,
                fit: BoxFit.cover,
              )),
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
      ),
    );
  }
}
