import 'package:fountain_fm/utils/colors.dart';
import 'package:fountain_fm/widgets/touchable_opacity.dart';
import 'package:flutter/material.dart';

class FountainButton extends StatelessWidget {
  const FountainButton({
    Key? key,
    this.onTap,
    this.width,
    this.height,
    this.padding,
    required this.text,
  }) : super(key: key);

  final VoidCallback? onTap;
  final double? width, height;
  final String text;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 327,
      height: height,
      child: TouchableOpacity(
        onTap: onTap,
        decoration: BoxDecoration(
          color: kFountainGreen,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Padding(
          padding: padding ?? const EdgeInsets.symmetric(vertical: 15),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                color: white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
