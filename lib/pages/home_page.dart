import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
// import 'package:ngdemo16/models/collection_model.dart';
// import 'package:ngdemo16/models/photo_model.dart';
// import 'package:ngdemo16/models/search_photos_res.dart';
import 'package:ngdemo16/pages/collection_page.dart';
import 'package:ngdemo16/pages/search_page.dart';
// import 'package:ngdemo16/services/http_service.dart';
// import 'package:ngdemo16/services/log_service.dart';

import '../controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final controller = Get.put(HomeController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Unsplash",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.pix_sharp,
            color: Colors.white,
          ),
        ),
      ),
      body: PageView(
        controller: controller.pageController,
        children: [
          SearchPage(),
          CollectionPage(),
        ],
        onPageChanged: (int index) {
          setState(() {
            controller.currentTap = index;
          });
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
            Icons.search,
            size: 32,
          )),
          BottomNavigationBarItem(
              icon: Icon(
            Icons.collections,
            size: 32,
          )),
        ],
        onTap: (index) => controller.changePage(index),
        currentIndex: controller.currentTap,
        activeColor: Colors.white,
      ),
    );
  }
}
