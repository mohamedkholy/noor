import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/helpers/assets_helper.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/core/widgets/decorated_container.dart';
import 'package:noor/features/lands/logic/lands_cubit.dart';
import 'package:noor/features/lands/ui/widgets/complete_Jinaazah_dialog.dart';
import 'package:noor/generated/l10n.dart';

class JinaazahWidget extends StatefulWidget {
  const JinaazahWidget({super.key});

  @override
  State<JinaazahWidget> createState() => _JinaazahWidgetState();
}

class _JinaazahWidgetState extends State<JinaazahWidget> {
  late final LandsCubit _landsCubit = context.read();

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            S.of(context).follow_jinaazah,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildJinaazahButton(
                title: S.of(context).until_prayer,
                icon: Assets.assetsImagesPngDuaaa,
                onTap: () {
                  _landsCubit.changeLandsCount(1);
                  showDialog(
                    barrierColor: Colors.black87,
                    context: context,
                    builder: (context) => const CompleteJinaazahDialog(
                      followJinaazahUntilBurial: false,
                    ),
                  );
                },
              ),
              const SizedBox(width: 16),
              _buildJinaazahButton(
                title: S.of(context).until_burial,
                icon: Assets.assetsImagesPngShovel,
                onTap: () {
                  _landsCubit.changeLandsCount(2);
                  showDialog(
                    barrierColor: Colors.black87,
                    context: context,
                    builder: (context) => const CompleteJinaazahDialog(
                      followJinaazahUntilBurial: true,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildJinaazahButton({
    required String title,
    required String icon,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          backgroundColor: MyColors.primary.withValues(alpha: 0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, width: 30, height: 30),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
