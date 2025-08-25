import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/features/tasbih/logic/tasbih_cubit.dart';
import 'package:noor/features/tasbih/ui/widgets/reset_dialog.dart';

class ResetButton extends StatelessWidget {
  final void Function() onResetPress;
  const ResetButton({super.key, required this.onResetPress});

  @override
  Widget build(BuildContext buildContext) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: buildContext,
          builder: (context) => BlocProvider.value(
            value: buildContext.read<TasbihCubit>(),
            child: ResetDialog(onResetPress: onResetPress),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsetsDirectional.only(start: 200),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade400,
        ),
        child: const Icon(Icons.refresh, color: Colors.black),
      ),
    );
  }
}
