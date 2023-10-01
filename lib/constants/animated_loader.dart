import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimatedLoader extends StatelessWidget {
  const AnimatedLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/animations/kids.json',
          repeat: true,
          reverse: true,
        ),
      ),
    );
  }
}

class AnimatedLoader2 extends StatelessWidget {
  const AnimatedLoader2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/animations/loading.json',
          repeat: true,
          reverse: true,
        ),
      ),
    );
  }
}

class AnimatedLoader3 extends StatelessWidget {
  const AnimatedLoader3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/animations/loading.json',
          repeat: true,
          reverse: true,
        ),
      ),
    );
  }
}
