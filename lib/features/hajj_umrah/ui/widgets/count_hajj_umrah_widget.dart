import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/helpers/assets_helper.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/core/widgets/decorated_container.dart';
import 'package:noor/features/hajj_umrah/data/models/sunan_data.dart';
import 'package:noor/features/hajj_umrah/logic/hajj_umrah_cubit.dart';
import 'package:noor/features/hajj_umrah/ui/widgets/complete_hajj_umrah_dialog.dart';
import 'package:noor/generated/l10n.dart';

class CountHajjUmrahWidget extends StatefulWidget {
  const CountHajjUmrahWidget({super.key});

  @override
  State<CountHajjUmrahWidget> createState() => _CountHajjUmrahWidgetState();
}

class _CountHajjUmrahWidgetState extends State<CountHajjUmrahWidget> {
  late final HajjUmrahCubit _hajjUmrahCubit = context.read();

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      fullWidth: false,
      child: Column(
        children: [
          const SizedBox(height: 16),
          Image.asset(Assets.assetsImagesPngKaaba, width: 60, height: 60),
          const SizedBox(height: 8),
          CheckboxListTile(
            checkboxScaleFactor: 1.2,
            activeColor: MyColors.secondary,
            checkColor: MyColors.primary,
            title: Text(
              S.of(context).completed_hajj_umrah,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            value: _hajjUmrahCubit.getHajjUmrahData().isCompleted,
            onChanged: (value) {
              _hajjUmrahCubit.saveHajjUmrahData(
                HajjUmrahData(date: DateTime.now(), isCompleted: value!),
              );
              if (value) {
                _hajjUmrahCubit.changeHajjUmrahCount(1);
                showDialog(
                  context: context,
                  builder: (context) => const CompleteHajjUmrahDialog(),
                );
              } else {
                _hajjUmrahCubit.changeHajjUmrahCount(-1);
              }
              setState(() {});
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
