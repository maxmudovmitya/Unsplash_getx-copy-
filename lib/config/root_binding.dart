import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:ngdemo16/controller/collection_controller.dart';
import 'package:ngdemo16/controller/home_controller.dart';
import 'package:ngdemo16/controller/photos_controller.dart';


class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => (HomeController), fenix: true);
    Get.lazyPut(() => (CollectionController), fenix: true);
    Get.lazyPut(() => (PhotosController), fenix: true);
    Get.lazyPut(() => (SearchController), fenix: true);
  }
}