import 'package:flutter/material.dart';

import 'crb.dart' as crb;

class RoundedClip extends StatelessWidget {
  final double cornerRadius;
  final Widget child;

  const RoundedClip({
    Key? key,
    required this.cornerRadius,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath.shape(
      shape: crb.ContinuousRectangleBorder(
        cornerRadius: cornerRadius,
      ),
      child: child,
    );
  }
}
