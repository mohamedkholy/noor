import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/features/near_mosque/data/models/mosque_data.dart';
import 'package:noor/features/near_mosque/logic/near_mosque_cubit.dart';
import 'package:noor/features/near_mosque/ui/widgets/expand_button.dart';
import 'package:noor/features/near_mosque/ui/widgets/mosque_details_widget.dart';
import 'package:noor/features/near_mosque/ui/widgets/mosque_widget.dart';

import '../../../../generated/l10n.dart';

class NearbyMosquesWidget extends StatefulWidget {
  final List<MosqueData> mosques;
  final VoidCallback onArrowClick;
  const NearbyMosquesWidget({
    super.key,
    required this.mosques,
    required this.onArrowClick,
  });

  @override
  State<NearbyMosquesWidget> createState() => _NearbyMosquesWidgetState();
}

class _NearbyMosquesWidgetState extends State<NearbyMosquesWidget> {
  MosqueData? mosqueData;

  @override
  void didUpdateWidget(covariant NearbyMosquesWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.mosques != widget.mosques) {
      mosqueData = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.5,
        minHeight: MediaQuery.sizeOf(context).height * 0.25,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                if (mosqueData != null)
                  InkWell(
                    onTap: () {
                      setState(() {
                        mosqueData = null;
                        context.read<NearMosqueCubit>().unselectMosque();
                      });
                    },
                    child: const Icon(Icons.arrow_back, size: 20),
                  ),
                if (mosqueData != null) const SizedBox(width: 10),
                Text(
                  mosqueData != null
                      ? S.current.details
                      : S.current.nearby_mosques,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                ExpandButton(
                  onArrowClick: () {
                    context.read<NearMosqueCubit>().unselectMosque();
                    widget.onArrowClick();
                  },
                ),
              ],
            ),
            Divider(color: Colors.grey.shade300, height: 20),
            mosqueData == null
                ? widget.mosques.isNotEmpty
                      ? Flexible(
                          child: ListView.separated(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: widget.mosques.length,
                            separatorBuilder: (context, index) {
                              return Divider(
                                color: Colors.grey.shade300,
                                height: 30,
                              );
                            },
                            itemBuilder: (context, index) {
                              final mosque = widget.mosques[index];
                              return InkWell(
                                onTap: () {
                                  context.read<NearMosqueCubit>().selectMosque(
                                    mosque: mosque,
                                  );
                                  setState(() {
                                    mosqueData = mosque;
                                  });
                                },
                                child: MosqueWidget(mosque: mosque),
                              );
                            },
                          ),
                        )
                      : SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.25,
                          child: Center(
                            child: Text(
                              S.current.no_nearby_mosques_found,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                : Flexible(
                    child: SingleChildScrollView(
                      child: MosqueDetailsWidget(mosqueData: mosqueData!),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
