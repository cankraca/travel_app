import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  final String url;
  const ImageDialog({required this.url, super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Image.asset(
        url,
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.width * 0.5,
        fit: BoxFit.cover,
      ),
    );
  }
}
