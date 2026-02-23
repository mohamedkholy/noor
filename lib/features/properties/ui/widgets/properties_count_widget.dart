import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/widgets/decorated_container.dart';
import 'package:noor/features/properties/logic/properties_cubit.dart';

class PropertiesCountWidget extends StatelessWidget {
  const PropertiesCountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const Text(
            "عدد الممتلكات",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context
                    .read<PropertiesCubit>()
                    .propertiesCount
                    .value
                    .toString(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              const Icon(
                FluentIcons.building_24_regular,
                color: Colors.white,
                size: 35,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
