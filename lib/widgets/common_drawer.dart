import 'package:flut_nasa_image_lib/pages/favorites/favorites_page.dart';
import 'package:flut_nasa_image_lib/pages/images/images_page.dart';
import 'package:flutter/material.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Image(
              image: AssetImage('assets/nasa.png'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const ImagesPage())
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorites'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => FavoritesPage())
              );
            },
          )
        ],
      ),
    );
  }
}