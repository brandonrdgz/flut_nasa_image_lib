import 'package:flut_nasa_image_lib/app/core/di.dart';
import 'package:flut_nasa_image_lib/app/utils/ui/app_icons.dart';
import 'package:flut_nasa_image_lib/generated/l10n.dart';
import 'package:flut_nasa_image_lib/app/core/module/images/image.dart' as model;
import 'package:flut_nasa_image_lib/app/ui/widget/app/app_scaffold.dart';
import 'package:flut_nasa_image_lib/app/ui/widget/app/empty.dart';
import 'package:flut_nasa_image_lib/app/ui/widget/app/error.dart';
import 'package:flut_nasa_image_lib/app/utils/widget/widget_ext.dart';
import 'package:flut_nasa_image_lib/app/ui/widget/favorites/favorite_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesScreen extends ConsumerWidget {

  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<model.Image>> favoritesAsyncValue = ref.watch(favoritesScreenControllerProvider);
    bool isNotEmpty = false;

    return AppScaffold(
      buildDrawer: false,
      title: S.of(context).favoritesPageTitle,
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
            return Empty(message: S.of(context).emptyFavoritesList);
          }
        },
        error: (error, stackTrace) {
          return Error(message: error.toString());
        },
        loading: () => const CircularProgressIndicator().center(),
      ),
      buildActionButton: isNotEmpty,
      fABContent: AppIcons.delete,
      fABOnPressed: () => ref.read(favoritesScreenControllerProvider.notifier).removeAllFavorites(),
    );
  }
}