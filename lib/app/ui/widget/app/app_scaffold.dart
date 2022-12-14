import 'package:flut_nasa_image_lib/app/ui/widget/app/app_drawer.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final bool buildDrawer;
  final String title;
  final Widget body;
  final bool buildActionButton;
  final Widget? fABContent;
  final void Function()? fABOnPressed;

  const AppScaffold({
    required this.buildDrawer,
    required this.title,
    required this.body,
    this.buildActionButton = false,
    this.fABContent,
    this.fABOnPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer ? const AppDrawer() : null,
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
      floatingActionButton: buildActionButton == false ? null : FloatingActionButton(
        child: fABContent,
        onPressed: fABOnPressed,
      ),
    );
  }
}