import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;

  const SvgIcon({
    super.key,
    required this.assetName,
    this.width,
    this.height,
    this.color,
  });

  final String assetName;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      width: width ?? 24,
      height: height ?? 24,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
    );
  }
}
