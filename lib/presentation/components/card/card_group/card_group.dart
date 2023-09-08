import 'package:flutter/material.dart';

class CardGroup extends StatelessWidget {
  const CardGroup({super.key, required this.children});
  final List<Widget> children;

  @override
  Widget build(Object context) => Stack(
        children: List.generate(
            children.length,
            (index) => Align(
                  alignment: Alignment(
                      -1.0 + (index / (children.length - 1)) * 2.0, 0),
                  child: children[index],
                )),
      );
}
