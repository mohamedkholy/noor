import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/routing/my_routes.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/core/widgets/my_app_bar.dart';
import 'package:noor/features/tasbih/logic/tasbih_cubit.dart';
import 'package:noor/features/tasbih/logic/tasbih_state.dart';
import 'package:noor/features/tasbih/ui/widgets/tasbih_dialog.dart';
import 'package:noor/features/tasbih/ui/widgets/tasbih_widget.dart';

import '../../../generated/l10n.dart';

class TasbihScreen extends StatefulWidget {
  const TasbihScreen({super.key});

  @override
  State<TasbihScreen> createState() => _TasbihScreenState();
}

class _TasbihScreenState extends State<TasbihScreen> {
  late final TasbihCubit _tasbihCubit = context.read();

  @override
  void initState() {
    super.initState();
    _tasbihCubit.getTasbih();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: S.current.tasbih),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors.primary,
        shape: const CircleBorder(),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => BlocProvider.value(
              value: _tasbihCubit,
              child: const TasbihDialog(),
            ),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: BlocBuilder<TasbihCubit, TasbihState>(
            builder: (context, state) {
              if (state is TasbihLoaded) {
                return ListView.builder(
                  itemCount: state.tasbih.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          MyRoutes.zekr,
                          arguments: state.tasbih[index],
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: index == state.tasbih.length - 1 ? 15 : 5,
                          top: index == 0 ? 15 : 5,
                        ),
                        child: TasbihWidget(tasbih: state.tasbih[index]),
                      ),
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(color: MyColors.primary),
              );
            },
          ),
        ),
      ),
    );
  }
}
