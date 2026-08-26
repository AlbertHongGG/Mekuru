import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets/splash_logo.dart';
import 'widgets/splash_title.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  // Logo animations
  late final Animation<double> _logoFade;
  late final Animation<double> _logoScale;

  // Title animations
  late final Animation<double> _titleUnfold;
  late final Animation<Offset> _titleSlide;
  late final Animation<double> _titleFade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _setupAnimations();

    // Start animation immediately
    _controller.forward();

    // Navigate to next screen when animation completes
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _navigateToHome();
      }
    });
  }

  void _setupAnimations() {
    // 1. Logo fades in and scales slightly
    _logoFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
      ),
    );
    _logoScale = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOutCubic),
      ),
    );

    // 2. Title unfolds, slides, and fades
    _titleUnfold = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.4, 0.9, curve: Curves.easeOutCubic),
    );
    
    _titleSlide = Tween<Offset>(
      begin: const Offset(0, -0.5),
      end: Offset.zero,
    ).animate(_titleUnfold);

    _titleFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 0.9, curve: Curves.easeOut),
      ),
    );
  }

  void _navigateToHome() async {
    // Wait briefly after animation completes before routing to let user appreciate it
    await Future.delayed(const Duration(milliseconds: 400));

    if (mounted) {
      // Use go() instead of push() to prevent going back to splash
      context.go('/library');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Pure white for a professional look
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SplashLogo(
              fadeAnimation: _logoFade,
              scaleAnimation: _logoScale,
            ),
            SplashTitle(
              unfoldAnimation: _titleUnfold,
              slideAnimation: _titleSlide,
              fadeAnimation: _titleFade,
            ),
          ],
        ),
      ),
    );
  }
}
