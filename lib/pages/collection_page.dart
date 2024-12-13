import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ngdemo16/pages/photos_page.dart';

import '../models/collection_model.dart';
import '../services/http_service.dart';
import '../services/log_service.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  bool isLoading = false;
  List<Collection> items = [];

  _callPhotosPage(Collection collection) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return PhotosPage(
        collection: collection,
      );
    }));
  }

  apiCollectionList() async {
    setState(() {
      isLoading = true;
    });

    var response = await Network.GET(
        Network.API_COLLECTIONS, Network.paramsCollections(1));
    List<Collection> collections = Network.parseCollections(response!);
    LogService.i(collections.length.toString());

    setState(() {
      items = collections;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    apiCollectionList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return _itemOfCollection(items[index]);
            },
          ),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _itemOfCollection(Collection collection) {
    return GestureDetector(
      onTap: () {
        _callPhotosPage(collection);
      },
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
                  Text(collection.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
