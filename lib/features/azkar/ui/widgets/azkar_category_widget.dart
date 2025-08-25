import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noor/core/database/azkar/azkar_database.dart';
import 'package:noor/core/helpers/assets_helper.dart';
import 'package:noor/core/routing/my_routes.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/core/theming/my_text_styles.dart';
import 'package:noor/core/widgets/decorated_container.dart';

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
      child: DecoratedContainer(
        padding: const EdgeInsets.all(15),
        color: MyColors.primary,
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
                  category.isFavorite ? Colors.amber : Colors.black,
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
              style: MyTextStyles.fontAmiriBold.copyWith(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
