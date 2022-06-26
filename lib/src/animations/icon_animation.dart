import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IconAnimation extends StatefulWidget {
  final String? icon;
  const IconAnimation({Key? key, required this.icon}) : super(key: key);

  @override
  State<IconAnimation> createState() => _IconAnimationState();
}

class _IconAnimationState extends State<IconAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Lottie.asset(
        'assets/animations/${widget.icon}.json',
        repeat: false,
        controller: controller,
        onLoaded: (composition) {
          controller.forward();
        },
      ),
    );
  }
}