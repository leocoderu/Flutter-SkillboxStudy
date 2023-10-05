import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class GalleryShow extends StatefulWidget {
  const GalleryShow({super.key});

  @override
  State<GalleryShow> createState() => _GalleryShowState();

  static void addImage({required XFile img}) {
    _GalleryShowState().adddImage(img);
  }

}

class _GalleryShowState extends State<GalleryShow> {
  List<XFile> gallery = [];

  void adddImage(XFile img) {
    setState(() {
      gallery.add(img);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: gallery.length,
          itemBuilder: (BuildContext context, int index) {
            return Image.file(File(gallery[index].path), fit: BoxFit.cover,);
          }
        ),
      ),
    );
  }
}
