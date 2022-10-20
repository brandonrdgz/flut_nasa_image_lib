import 'package:flut_nasa_image_lib/controllers/favorites/favorites_page_controller.dart';
import 'package:flut_nasa_image_lib/models/image.dart' as model;
import 'package:flut_nasa_image_lib/widgets/common_scaffold.dart';
import 'package:flut_nasa_image_lib/widgets/empty.dart';
import 'package:flut_nasa_image_lib/widgets/error.dart';
import 'package:flut_nasa_image_lib/widgets/favorites/favorite_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesPage extends ConsumerWidget {

  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<model.Image>> favoritesAsyncValue = ref.watch(favoritesPageControllerProvider);
    bool isNotEmpty = false;

    return CommonScaffold(
      buildDrawer: false,
      title: 'Favorites',
      body: favoritesAsyncValue.when(
        data: (favoritesListData) {
          if(favoritesListData.isNotEmpty) {
            isNotEmpty = true;
            return ListView.builder(
              itemCount: favoritesListData.length,
              itemBuilder: (_, index) {
                return FavoriteCard(
                  favorite: favoritesListData[index],
                );
              },
            );
          }
          else {
            isNotEmpty = false;
            return const Empty(message: 'You don\'t have any favorites yet');
          }
        },
        error: (error, stackTrace) {
          return Error(message: error.toString());
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      buildActionButton: isNotEmpty,
      fABContent: const Icon(Icons.delete),
      fABOnPressed: () => ref.read(favoritesPageControllerProvider.notifier).removeAllFavorites(),
    );
  }
}