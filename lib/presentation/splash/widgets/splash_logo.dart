import 'package:flutter/material.dart';
import '../../../core/constants/app_assets.dart';

class SplashLogo extends StatelessWidget {
  final Animation<double> fadeAnimation;
  final Animation<double> scaleAnimation;

  const SplashLogo({
    super.key,
    required this.fadeAnimation,
    required this.scaleAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Image.asset(
          AppAssets.logo,
          width: 140, // Nice and prominent
          height: 140,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            // Fallback if logo is missing or error
            return const Icon(
              Icons.book,
              size: 100,
              color: Colors.blueAccent,
            );
          },
        ),
      ),
    );
  }
}
