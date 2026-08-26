import 'package:flutter/material.dart';

class SplashTitle extends StatelessWidget {
  final Animation<double> unfoldAnimation;
  final Animation<Offset> slideAnimation;
  final Animation<double> fadeAnimation;

  const SplashTitle({
    super.key,
    required this.unfoldAnimation,
    required this.slideAnimation,
    required this.fadeAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: unfoldAnimation,
      builder: (context, child) {
        return ClipRect(
          child: Align(
            alignment: Alignment.topCenter,
            heightFactor: unfoldAnimation.value,
            child: child,
          ),
        );
      },
      child: SlideTransition(
        position: slideAnimation,
        child: FadeTransition(
          opacity: fadeAnimation,
          child: const Padding(
            padding: EdgeInsets.only(top: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Mekuru',
                  style: TextStyle(
                    fontFamily: 'Outfit', // Assuming you have this or will use default
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1D1D1F), // Elegant dark color
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'SMART READING ASSISTANT',
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF86868B), // Subtle secondary color
                    letterSpacing: 6.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
