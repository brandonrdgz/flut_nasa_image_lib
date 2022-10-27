import 'package:flut_nasa_image_lib/app/ui/module/images/screen.dart';
import 'package:flut_nasa_image_lib/app/utils/ui/app_icons.dart';
import 'package:flut_nasa_image_lib/generated/l10n.dart';
import 'package:flut_nasa_image_lib/app/ui/module/favorites/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: SvgPicture.asset('assets/image/nasa.svg'),
          ),
          ListTile(
            leading: AppIcons.list,
            title: Text(S.of(context).homeDrawerSection),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute<ImagesScreen>(builder: (context) => const ImagesScreen())
              );
            },
          ),
          ListTile(
            leading: AppIcons.favoriteFilled,
            title: Text(S.of(context).favoritesDrawerSection),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push<FavoritesScreen>(
                MaterialPageRoute(builder: (context) => const FavoritesScreen())
              );
            },
          )
        ],
      ),
    );
  }
}