import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
    this.padding = const EdgeInsets.only(top: 20),
    this.size = 20,
    this.backAction,
    this.imageUrl = 'https://cdn-icons-png.flaticon.com/512/5556/5556468.png',
  });

  final EdgeInsets padding;
  final double size;
  final VoidCallback? backAction;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(imageUrl),
      radius: size,
    );
  }
}
