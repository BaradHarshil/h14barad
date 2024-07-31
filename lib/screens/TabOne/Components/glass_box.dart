import 'package:flutter/material.dart';
import 'dart:ui';

class GlassBox extends StatefulWidget {
  final child;

  const GlassBox({super.key, required this.child});

  @override
  State<GlassBox> createState() => _GlassBoxState();
}

class _GlassBoxState extends State<GlassBox> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10,
          ),
          child: Container(
            height: 150,
            alignment: Alignment.bottomCenter,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
