import 'package:flutter/material.dart';
import 'package:noor/core/helpers/assets_helper.dart';
import 'package:noor/core/theming/my_colors.dart';

class DecoratedContainer extends StatelessWidget {
  final DecorationImage? image;
  final Widget child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Color? color;
  final bool? fullWidth;
  const DecoratedContainer({
    super.key,
    this.image,
    required this.child,
    this.margin,
    this.padding,
    this.borderRadius,
    this.color,
    this.fullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: fullWidth == true ? double.infinity : null,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        image:
            image ??
            const DecorationImage(
              image: AssetImage(Assets.assetsImagesPngWindow5),
              fit: BoxFit.cover,
              opacity: .04,
            ),
        gradient: LinearGradient(
          colors: [
            MyColors.primary.withAlpha(180),
            Color.lerp(MyColors.primary.withAlpha(200), Colors.black, 0.3)!,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: borderRadius ?? BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: MyColors.primary.withValues(alpha: 0.4),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: child,
    );
  }
}
