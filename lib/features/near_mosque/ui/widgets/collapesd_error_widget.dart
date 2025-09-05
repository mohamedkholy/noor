import 'package:flutter/material.dart';
import 'package:noor/features/near_mosque/data/models/near_mosque_error.dart';
import 'package:noor/features/near_mosque/ui/widgets/expand_button.dart';

class CollapesdErrorWidget extends StatelessWidget {
  const CollapesdErrorWidget({
    super.key,
    required this.isLocationDeniedExpanded,
    required this.errorType,
    required this.message,
  });

  final ValueNotifier<bool> isLocationDeniedExpanded;
  final NearMosqueError errorType;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          margin: const EdgeInsets.only(top: 10, right: 10),
          padding: const EdgeInsetsDirectional.only(start: 5),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                errorType == NearMosqueError.locationDenied
                    ? Icons.location_off
                    : errorType == NearMosqueError.noInternet
                    ? Icons.wifi_off
                    : Icons.error,
                color: Colors.red,
              ),
              Text(
                message,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              ExpandButton(
                onArrowClick: () {
                  isLocationDeniedExpanded.value =
                      !isLocationDeniedExpanded.value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
