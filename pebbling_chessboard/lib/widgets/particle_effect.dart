// lib/widgets/particle_effect.dart
import 'package:flutter/material.dart';

class ParticleBurst extends StatefulWidget {
  final Offset position; // top-left of the cell
  final double cellSize;
  final VoidCallback? onCompleted;
  const ParticleBurst({Key? key, required this.position, required this.cellSize, this.onCompleted}) : super(key: key);

  @override
  State<ParticleBurst> createState() => _ParticleBurstState();
}

class _ParticleBurstState extends State<ParticleBurst> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();
      _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 300))
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            widget.onCompleted?.call();
          }
        });
    _anim = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (context, child) {
        final radius = widget.cellSize * 0.5 * _anim.value;
        return Positioned(
          left: widget.position.dx + widget.cellSize / 2 - radius,
          top: widget.position.dy + widget.cellSize / 2 - radius,
          child: Opacity(
            opacity: 1.0 - _anim.value,
            child: Container(
              width: radius * 2,
              height: radius * 2,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellowAccent,
              ),
            ),
          ),
        );
      },
    );
  }
}
