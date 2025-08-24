import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noor/core/database/azkar/azkar_database.dart';
import 'package:noor/core/helpers/assets_helper.dart';
import 'package:noor/core/routing/my_routes.dart';
import 'package:noor/core/theming/my_colors.dart';

class AzkarCategoryWidget extends StatelessWidget {
  final CategoryData category;
  final Function(CategoryData) onToggleFavorite;
  const AzkarCategoryWidget({
    super.key,
    required this.category,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          MyRoutes.azkarCategory,
          arguments: category.category,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(Assets.assetsImagesPngWindow),
            opacity: .03,
            fit: BoxFit.cover,
          ),
          color: MyColors.primary.withAlpha(50),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                onToggleFavorite(category);
              },
              child: SvgPicture.asset(
                category.isFavorite
                    ? Assets.assetsImagesSvgOctagonallShapeSolid
                    : Assets.assetsImagesSvgOctagonallShape,
                colorFilter: ColorFilter.mode(
                  category.isFavorite ? MyColors.primary : Colors.black,
                  BlendMode.srcIn,
                ),
                width: 50,
                height: 50,
              ),
            ),
            const Spacer(),
            Text(
              textDirection: TextDirection.rtl,
              category.category,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: "Amiri",
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
