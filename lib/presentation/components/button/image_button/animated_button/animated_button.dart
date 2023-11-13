import 'package:card_game/app/utils/env/device_info.dart';
import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({
    super.key,
    this.size = 40,
    this.action,
    this.animatedDuration = 100,
    required this.path,
  });

  final double size;
  final VoidCallback? action;
  final String path;
  final int animatedDuration;

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  final scale = DeviceInfo().scale();
  double _size = 0;
  bool _calling = false;

  void _updateSize({bool calling = true}) {
    setState(() {
      _calling = calling;
      _size = _calling ? widget.size - 10 : widget.size;
    });
  }

  void _endAnimation() {
    _updateSize(calling: false);
    if (widget.action != null) {
      widget.action!();
    }
  }

  Future<void> _onClick() async {
    _updateSize();
    Future.delayed(Duration(milliseconds: widget.animatedDuration)).then((_) {
      _endAnimation();
    });
  }

  @override
  void initState() {
    super.initState();
    _size = widget.size;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onClick,
      onLongPressDown: (_) {
        _updateSize();
      },
      onLongPressUp: () {
        _endAnimation();
      },
      onLongPressCancel: () {
        _updateSize(calling: false);
      },
      child: Image.asset(
        widget.path,
        width: _size * scale,
        height: _size * scale,
        fit: BoxFit.cover,
      ),
    );
  }
}
