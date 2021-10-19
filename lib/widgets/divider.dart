import 'package:fountain_fm/utils/colors.dart';
import 'package:flutter/material.dart';

class FountainDivider extends StatelessWidget {
  const FountainDivider({
    Key? key,
    this.width,
    this.height,
    this.color,
  }) : super(key: key);

  final double? width, height;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        width: width ?? 44,
        height: height ?? 1.4,
        color: color ?? kGreyDivider,
      ),
    );
  }
}
