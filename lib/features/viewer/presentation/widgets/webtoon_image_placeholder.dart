import 'package:flutter/material.dart';

class WebtoonImagePlaceholder extends StatefulWidget {
  final int index;
  const WebtoonImagePlaceholder({super.key, required this.index});

  @override
  State<WebtoonImagePlaceholder> createState() => _WebtoonImagePlaceholderState();
}

class _WebtoonImagePlaceholderState extends State<WebtoonImagePlaceholder> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.15, end: 0.4).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // A standard slice height to prevent the "chain of beads" look
    final height = MediaQuery.of(context).size.width * 1.3; 
    
    return Container(
      height: height,
      width: double.infinity,
      color: const Color(0xFF0A0A0A), // Extremely dark grey, almost black
      child: FadeTransition(
        opacity: _animation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(
                color: Colors.white, // Opacity is controlled by FadeTransition
                strokeWidth: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '${widget.index + 1}',
              style: const TextStyle(
                color: Colors.white, // Opacity is controlled by FadeTransition
                fontSize: 16,
                letterSpacing: 4,
                fontWeight: FontWeight.w300,
                fontFamily: 'Outfit',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
