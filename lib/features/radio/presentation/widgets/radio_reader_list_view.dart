import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/features/radio/presentation/manager/cubit/radio_cubit.dart';
import 'package:noor/features/radio/presentation/screens/radio_detail_screen.dart';
import 'package:noor/features/radio/presentation/widgets/loading_listview.dart';
import 'package:noor/features/radio/presentation/widgets/radio_reader_item.dart';

class RadioReaderListView extends StatelessWidget {
  const RadioReaderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioCubit, RadioState>(
      builder: (context, state) {
        final cubit = context.read<RadioCubit>();
        if (state is RadioLoading) {
          return const LoadingListView();
        }
        if (state is RadioError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.failure)),
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RadioDetailScreen(
                    radioData: cubit.radioList[index],
                    radioList: cubit.radioList,
                  ),
                ),
              );
            },
            child: RadioReaderItem(
              radioData: cubit.radioList[index],
              radioList: cubit.radioList,
            ),
          ),
          itemCount: cubit.radioList.length,
        );
      },
    );
  }
}
