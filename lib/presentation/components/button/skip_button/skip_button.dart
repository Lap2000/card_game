import 'package:flutter/material.dart';

class SkipButton extends StatefulWidget {
  const SkipButton({
    super.key,
    this.padding = const EdgeInsets.all(0),
    this.size = 40,
    this.backAction,
  });

  final EdgeInsets padding;
  final double size;
  final VoidCallback? backAction;

  @override
  State<SkipButton> createState() => _SkipButtonState();
}

class _SkipButtonState extends State<SkipButton> with TickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> animation;
  late AnimationStatus animationStatus = AnimationStatus.dismissed;

  late double yCard = 0;
  late double xCard = 0;

  @override
  void initState() {
    // TODO: implement onInit
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    // animation = Tween(begin: 100.0, end: 200.0).animate(animationController)
    //   ..addListener(() {
    //     //print(animationStatus);
    //     //print(animationController.isCompleted);
    //     if (animationController.isCompleted) {
    //       setState(() {
    //         xCard = 0;
    //       });
    //     } else {
    //       setState(() {
    //         xCard += 0;
    //       });
    //     }
    //   })
    //   ..addStatusListener((status) {
    //     animationStatus = status;
    //   });
    // animationController.forward();
    animation = Tween(begin: 0.0, end: 150.0).animate(animationController)
      ..addListener(() {
        setState(() {
          setState(() {});
        });
      })
      ..addStatusListener((status) {
        animationStatus = status;
      });

    animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

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
      padding: widget.padding,
      child: AnimatedBuilder(
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, animation.value),
            child: child,
          );
        },
        animation: animationController.view,
        child: Visibility(
          visible: animation.isCompleted ? false : true,
          child: Container(
            width: 80,
            height: 35,
            padding: EdgeInsets.zero,
            child: ElevatedButton(
              onPressed: widget.backAction ?? () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(getColor),
              ),
              child: const Center(
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Gluten',
                    color: Colors.amberAccent,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
