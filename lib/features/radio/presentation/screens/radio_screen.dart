import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/widgets/my_app_bar.dart';
import 'package:noor/features/radio/presentation/manager/cubit/radio_cubit.dart';
import 'package:noor/features/radio/presentation/widgets/radio_reader_list_view.dart';
import 'package:noor/generated/l10n.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  @override
  void initState() {
    super.initState();
    context.read<RadioCubit>().getRadio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(title: S.of(context).radio),
      body: const SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [SizedBox(height: 24), RadioReaderListView()],
          ),
        ),
      ),
    );
  }
}
