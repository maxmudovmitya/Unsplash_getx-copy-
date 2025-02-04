//import 'dart:io';

// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ngdemo16/models/photo_model.dart';

class DetailsPage extends StatefulWidget {
  final Photo? photo;

  const DetailsPage({super.key, this.photo});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.photo!.description ?? "No name",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        // actions: [
          // IconButton(
          //   onPressed: (){
          //     shareImage(widget.photo!.urls.full);
          //   },
          //   icon: Icon(Icons.ios_share, color: Colors.white,),
          ),
        //],
      //),
      //body: Container(
        //width: double.infinity,
        //child: Stack(
          //children: [
            //InteractiveViewer(
              //panEnabled: true,
              //minScale: 1.0,
              //maxScale: 4.0,
              //child: CachedNetworkImage(
                //imageUrl: widget.photo!.urls.full,
                //fit: BoxFit.cover,
                //height: double.infinity,
            //  ),
           // )
         //],
     //   ),
   //   ),

     // floatingActionButton: FloatingActionButton(
  //      backgroundColor: Colors.black,
 //       onPressed: (){
 //         downloadImage(widget.photo!.urls.full);
     //   },
  //      child: Icon(Icons.file_download, color: Colors.white,),
   //  ),
    );
  }
}
