import 'package:flut_nasa_image_lib/controllers/images/images_page_controller.dart';
import 'package:flut_nasa_image_lib/models/image.dart' as model;
import 'package:flut_nasa_image_lib/widgets/common_scaffold.dart';
import 'package:flut_nasa_image_lib/widgets/empty.dart';
import 'package:flut_nasa_image_lib/widgets/error.dart';
import 'package:flut_nasa_image_lib/widgets/images/image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImagesPage extends ConsumerWidget {
  const ImagesPage({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<model.Image>> imagesAsyncValue = ref.watch(imagesPageControllerProvider);

    return CommonScaffold(
      buildDrawer: true,
      title: 'Flut NASA Image Library',
      body: imagesAsyncValue.when(
        data: (imagesListData) {
          if(imagesListData.isNotEmpty) {
            return ListView.builder(
              itemCount: imagesListData.length,
              itemBuilder: (_, index) {
                return ImageCard(
                  image: imagesListData[index]
                );
              },
            );
          }
          else {
            return const Empty(message: 'No images available');
          }
        },
        error: (error, stackTrace) {
          return Error(message: error.toString());
        },
        loading: () => const Center(child: CircularProgressIndicator(),),
      ),
    );
  }

}