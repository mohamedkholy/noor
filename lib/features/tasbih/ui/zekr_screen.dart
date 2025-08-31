import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/database/tasbih/tasbih_database.dart';
import 'package:noor/core/helpers/assets_helper.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/core/widgets/my_app_bar.dart';
import 'package:noor/features/tasbih/logic/tasbih_cubit.dart';
import 'package:noor/features/tasbih/ui/widgets/count_button.dart';
import 'package:noor/features/tasbih/ui/widgets/reset_button.dart';
import 'package:noor/features/tasbih/ui/widgets/shape.dart';
import 'package:noor/features/tasbih/ui/widgets/tasbih_count_widget.dart';

class ZekrScreen extends StatefulWidget {
  final Tasbih tasbih;
  const ZekrScreen({super.key, required this.tasbih});

  @override
  State<ZekrScreen> createState() => _ZekrScreenState();
}

class _ZekrScreenState extends State<ZekrScreen> {
  late final TasbihCubit _tasbihCubit = context.read();
  late int count = widget.tasbih.count;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: widget.tasbih.zekr,
        fontSize: 30,
        fontFamily: "Amiri",
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              MyColors.primary,
              MyColors.primary.withAlpha(200),
              MyColors.primary.withAlpha(180),
              MyColors.primary,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Stack(
              children: [
                Image.asset(
                  Assets.assetsImagesPngWindow6PhotoroomPhotoroom,
                  opacity: const AlwaysStoppedAnimation(.02),
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
                Align(
                  child: SingleChildScrollView(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                            vertical: (constraints.maxWidth * .15),
                          ),
                          child: CustomPaint(
                            painter: Shape(),
                            child: SizedBox(
                              width: constraints.maxWidth,
                              height: constraints.maxWidth,
                              child: Column(
                                children: [
                                  TasbihCountWidget(count: count),
                                  const Spacer(),
                                  ResetButton(
                                    onResetPress: () {
                                      setState(() {
                                        count = 0;
                                        _tasbihCubit.updateCount(
                                          Tasbih(
                                            zekr: widget.tasbih.zekr,
                                            count: count,
                                          ),
                                        );
                                      });
                                    },
                                  ),
                                  CountButton(
                                    width: constraints.maxWidth / 3,
                                    height: constraints.maxWidth / 3,
                                    onTap: () {
                                      setState(() {
                                        count++;
                                        _tasbihCubit.updateCount(
                                          Tasbih(
                                            zekr: widget.tasbih.zekr,
                                            count: count,
                                          ),
                                        );
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
