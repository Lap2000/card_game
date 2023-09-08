import 'package:flutter/material.dart';

class GetCardButton extends StatelessWidget {
  const GetCardButton({
    super.key,
    this.padding = const EdgeInsets.all(0),
    this.size = 40,
    this.backAction,
  });

  final EdgeInsets padding;
  final double size;
  final VoidCallback? backAction;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Padding(
      padding: padding,
      child: Container(
        width: 80,
        height: 35,
        padding: EdgeInsets.zero,
        child: ElevatedButton(
          onPressed: backAction ?? () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(getColor),
          ),
          child: const Center(
            child: Text(
              'Rút bài',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Gluten',
                color: Colors.amberAccent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
