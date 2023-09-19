import 'package:card_game/app/type/card_value_enum.dart';
import 'package:card_game/app/type/suits_enum.dart';
import 'package:card_game/infrastructure/models/playing_card/playing_card.dart';
import 'package:card_game/presentation/components/card/player_card/custom_playing_card.dart';
import 'package:flutter/material.dart';

typedef MyBuilder = void Function(BuildContext context, void Function() func);

class FreeCards extends StatefulWidget {
  const FreeCards({
    super.key,
    this.padding = const EdgeInsets.all(0),
    this.size = 40,
    this.action,
    required this.builder,
  });

  final EdgeInsets padding;
  final double size;
  final VoidCallback? action;
  final MyBuilder builder;

  @override
  State<FreeCards> createState() => _FreeCardsState();
}

class _FreeCardsState extends State<FreeCards> with TickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> animation;
  late final Animation<double> animationScale;
  late AnimationStatus animationStatus = AnimationStatus.dismissed;

  late double yCard = 0;
  late double xCard = 0;

  ShapeBorder shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(3),
    side: const BorderSide(color: Colors.black, width: 0.1),
  );

  @override
  void initState() {
    // TODO: implement onInit
    super.initState();
    initAnimation();
  }

  void initAnimation() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    // left and right : (begin: 0.0, end: 150.0)
    // top : (begin: 0.0, end: 100.0)
    animation = Tween(begin: 0.0, end: 100.0).animate(animationController)
      ..addListener(() {
        if (animationController.isCompleted && widget.action != null) {
          setState(() {
            widget.action!();
          });
        }
        setState(() {});
      })
      ..addStatusListener((status) {
        animationStatus = status;
      });
    animationScale = Tween(begin: 1.0, end: 0.75).animate(animationController)
      ..addListener(() {
        setState(() {
          setState(() {});
        });
      })
      ..addStatusListener((status) {
        animationStatus = status;
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  void callAnimation() {
    animationController.reset();
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    widget.builder.call(context, callAnimation);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: widget.padding,
          child: InkWell(
            onTap: callAnimation,
            child: Stack(
              children: [
                _card(),
                AnimatedBuilder(
                  builder: (context, child) {
                    return Transform.translate(
                      // left : Offset(animation.value, 0),
                      // right : Offset(-animation.value, 0),
                      // top-left : Offset(animation.value, -animation.value),
                      // top-right : Offset(-animation.value, -animation.value),
                      // top-center : Offset(0, -animation.value),
                      // bottom-left : Offset(-animation.value, animation.value),
                      // bottom-right : Offset(animation.value, animation.value),
                      offset: Offset(-animation.value, animation.value),
                      child: Transform.scale(
                        scale: animationScale.value,
                        child: child,
                      ),
                    );
                  },
                  animation: animationController.view,
                  child: Visibility(
                    visible: animation.isCompleted ? false : true,
                    child: _card(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _card() {
    return SizedBox(
      width: 80,
      height: 110,
      child: CustomPlayerCard(
        card: PlayingCard(Suit.hearts, CardValue.ten),
        showBack: true,
        elevation: 3.0,
        shape: shape,
      ),
    );
  }
}
