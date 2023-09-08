import 'package:card_game/presentation/components/table/table.dart';
import 'package:flutter/material.dart';

class TableList extends StatelessWidget {
  const TableList({
    super.key,
    this.padding = const EdgeInsets.symmetric(horizontal: 40),
  });

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 40,
          mainAxisSpacing: 40,
        ),
        itemCount: 27,
        itemBuilder: (context, index) {
          return const CardTable();
        },
      ),
    );
  }
}
