import 'package:flutter/material.dart';

class CommonCard extends StatelessWidget {
  final Widget cardContent;

  const CommonCard({
    required this.cardContent,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: cardContent,
      ),
    );
  }
}