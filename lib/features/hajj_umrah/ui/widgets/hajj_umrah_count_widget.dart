import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/helpers/assets_helper.dart';
import 'package:noor/core/widgets/decorated_container.dart';
import 'package:noor/features/hajj_umrah/logic/hajj_umrah_cubit.dart';
import 'package:noor/generated/l10n.dart';

class HajjUmrahCountWidget extends StatelessWidget {
  const HajjUmrahCountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Text(
            S.of(context).hajj_umrah_count,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ValueListenableBuilder(
                valueListenable: context.read<HajjUmrahCubit>().hajjUmrahCount,
                builder: (context, value, child) {
                  return Text(
                    value.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  );
                },
              ),
              const SizedBox(width: 10),
              Image.asset(Assets.assetsImagesPngKaaba, width: 25, height: 25),
            ],
          ),
        ],
      ),
    );
  }
}
