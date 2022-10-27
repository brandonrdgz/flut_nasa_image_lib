import 'package:flut_nasa_image_lib/app/ui/module/images/screen.dart';
import 'package:flut_nasa_image_lib/generated/l10n.dart';
import 'package:flut_nasa_image_lib/app/utils/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Permission permission = Permission.storage;
  PermissionStatus permissionStatus = await permission.status;

  while(permissionStatus.isDenied) {
    permissionStatus = await permission.request();
  }

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('es', 'ES'),
      title: 'Flutter Nasa Image Library App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: AppColors.colorSchemeSeed,
        brightness: Brightness.dark,
      ),
      home: const ImagesScreen(),
    );
  }
}

