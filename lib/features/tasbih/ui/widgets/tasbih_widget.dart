import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/database/tasbih/tasbih_database.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/core/theming/my_text_styles.dart';
import 'package:noor/core/widgets/decorated_container.dart';
import 'package:noor/features/tasbih/logic/tasbih_cubit.dart';
import 'package:noor/features/tasbih/ui/widgets/tasbih_dialog.dart';

class TasbihWidget extends StatelessWidget {
  final Tasbih tasbih;
  const TasbihWidget({super.key, required this.tasbih});

  @override
  Widget build(BuildContext buildcontext) {
    return DecoratedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(15),
      borderRadius: BorderRadius.circular(10),
      color: MyColors.primary,
      child: Row(
        children: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == "delete") {
                buildcontext.read<TasbihCubit>().deleteTasbih(tasbih);
              } else if (value == "edit") {
                showDialog(
                  context: buildcontext,
                  builder: (context) => BlocProvider.value(
                    value: buildcontext.read<TasbihCubit>(),
                    child: TasbihDialog(tasbih: tasbih),
                  ),
                );
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: "edit", child: Text("Edit")),
              const PopupMenuItem(value: "delete", child: Text("Delete")),
            ],
            child: const Icon(Icons.more_vert, size: 35, color: Colors.white),
          ),
          Expanded(
            child: Column(
              textDirection: TextDirection.rtl,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    textDirection: TextDirection.rtl,
                    tasbih.zekr,
                    style: MyTextStyles.fontAmiriBold.copyWith(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    textDirection: TextDirection.rtl,
                    "التكرار: ${tasbih.count.toString()}",
                    style: MyTextStyles.fontAmiriBold.copyWith(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
