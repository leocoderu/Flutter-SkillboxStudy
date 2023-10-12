// Import Flutter
import 'package:flutter/material.dart';
import 'dart:io';

// Import Packages
import 'package:flutter_bloc/flutter_bloc.dart';

// Clear Architecture
import 'package:camera_use/business/gallery_bloc.dart';
import 'package:camera_use/model/gallery_model.dart';

class GalleryShow extends StatelessWidget {
  const GalleryShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Images gallery'),
        centerTitle: true,
      ),
      body: BlocBuilder<GalleryBloc, GalleryModel>(
        builder: (context, state) {
          return state.images.isEmpty
            ? const Center(child: Text('Gallery is Empty'))
            : Center(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 2,
                  crossAxisCount: 1,
                ),
                itemCount: state.images.length,
                itemBuilder: (_, index) => Image.file(File(state.images[index]), fit: BoxFit.fitWidth,)
              ),
            );
        },
      ),
    );
  }
}
