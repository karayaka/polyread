import 'dart:io';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomFileImageComponent extends StatelessWidget {
  String path;
  CustomFileImageComponent({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Image.file(
      File(path), //todo resim yoksa broken image iconu koy
      fit: BoxFit.cover,
      errorBuilder: (context, url, error) => Container(
        color: Colors.grey[300],
        alignment: Alignment.center,
        child: const Icon(Icons.broken_image, size: 56),
      ),
    );
  }
}
