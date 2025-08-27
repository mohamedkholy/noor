import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/helpers/distance_calculator.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/features/near_mosque/data/models/mosque_data.dart';
import 'package:noor/features/near_mosque/logic/near_mosque_cubit.dart';
import 'package:noor/features/near_mosque/ui/widgets/distance_widget.dart';

class MosqueDetailsWidget extends StatelessWidget {
  const MosqueDetailsWidget({super.key, required this.mosqueData});

  final MosqueData mosqueData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mosqueData.name,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    mosqueData.address ?? "",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: MyColors.primary,
                  ),
                  child: const Icon(
                    Icons.near_me,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text("${mosqueData.distance.toStringAsFixed(2)} KM"),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: DistanceWidget(
                distance: mosqueData.distance,
                title: "Ariel Distance",
                icon: Icons.straight,
                margin: const EdgeInsets.symmetric(horizontal: 5),
              ),
            ),
            Expanded(
              child: DistanceWidget(
                distance: DistanceCalculator.calculateRouteDistance(
                  mosqueData.route,
                ),
                title: "Road Distance",
                icon: Icons.straight,
                margin: const EdgeInsets.symmetric(horizontal: 5),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 60),
            backgroundColor: MyColors.primary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          onPressed: () {
            context.read<NearMosqueCubit>().Navigate(mosqueData.location);
          },
          icon: const Icon(Icons.navigation_sharp, size: 25),
          label: const Text(
            "Start Navigation",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
