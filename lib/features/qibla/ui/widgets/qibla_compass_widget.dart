import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noor/core/helpers/assets_helper.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/features/qibla/ui/widgets/qibla_text_widget.dart';

class QiblahCompassWidget extends StatelessWidget {
  final _compassSvg = SvgPicture.asset(
    Assets.assetsImagesSvgCompass,
    colorFilter: const ColorFilter.mode(MyColors.primary, BlendMode.srcIn),
  );
  final _needleSvg = SvgPicture.asset(
    Assets.assetsImagesSvgNeedle,
    height: 300,
  );

  QiblahCompassWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FlutterQiblah.qiblahStream,
      builder: (_, AsyncSnapshot<QiblahDirection> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: MyColors.primary),
          );
        }

        final qiblahDirection = snapshot.data;
        final children = [
          QiblaTextWidget(qibla: qiblahDirection?.offset ?? 0),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Transform.rotate(
                  angle: ((qiblahDirection?.direction ?? 0) * (pi / 180) * -1),
                  child: _compassSvg,
                ),
                Transform.rotate(
                  angle: ((qiblahDirection?.qiblah ?? 0) * (pi / 180) * -1),
                  child: _needleSvg,
                ),
              ],
            ),
          ),
        ];

        return Container(
          margin: const EdgeInsets.all(20.0),
          child: MediaQuery.sizeOf(context).width < 600
              ? Column(children: children)
              : Row(children: children),
        );
      },
    );
  }
}
