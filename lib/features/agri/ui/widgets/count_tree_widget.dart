import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/helpers/assets_helper.dart';
import 'package:noor/core/widgets/decorated_container.dart';
import 'package:noor/features/agri/logic/agri_cubit.dart';
import 'package:noor/generated/l10n.dart';

class CountTreeWidget extends StatefulWidget {
  const CountTreeWidget({super.key});

  @override
  State<CountTreeWidget> createState() => _CountTreeWidgetState();
}

class _CountTreeWidgetState extends State<CountTreeWidget> {
  late final AgriCubit _agriCubit = context.read();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(1000),
      onTap: () {
        _agriCubit.changeTreesCount(1);
      },
      child: DecoratedContainer(
        fullWidth: false,
        shape: BoxShape.circle,
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Text(
              S.of(context).plant_tree,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Image.asset(Assets.assetsImagesPngForest, width: 60, height: 60),
          ],
        ),
      ),
    );
  }
}
