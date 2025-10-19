import 'package:flutter/material.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/core/theming/my_text_styles.dart';
import 'package:noor/features/radio/data/model/radio_data.dart';
import 'package:noor/features/radio/presentation/widgets/radio_reader_audio.dart';
import 'package:noor/features/radio/presentation/widgets/radio_reader_item.dart';

class RadioDetailScreen extends StatefulWidget {
  final RadioData radioData;

  final List<RadioData> radioList;
  const RadioDetailScreen({
    super.key,
    required this.radioData,
    required this.radioList,
  });

  @override
  State<RadioDetailScreen> createState() => _RadioDetailScreenState();
}

class _RadioDetailScreenState extends State<RadioDetailScreen> {
  late RadioData selectedRadio;
  late List<RadioData> otherRadios;

  @override
  void initState() {
    super.initState();
    selectedRadio = widget.radioData;
    otherRadios = List.from(widget.radioList)
      ..removeWhere((element) => element.id == widget.radioData.id);
  }

  void changeRadio(RadioData newRadio) {
    setState(() {
      otherRadios.add(selectedRadio);

      otherRadios.removeWhere((element) => element.id == newRadio.id);

      selectedRadio = newRadio;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isLandScape ? SizedBox(height: 16) : SizedBox(height: 120),
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.network(selectedRadio.img!, height: 200),
              ),
              SizedBox(height: 24),
              Text(
                selectedRadio.name!,
                style: MyTextStyles.f18CairoSemiBoldPrimary.copyWith(
                  color: MyColors.primary,
                ),
              ),
              SizedBox(height: 30),
              RadioReaderAudio(
                radioData: selectedRadio,
                radioList: widget.radioList,
                onRadioChangeRight: changeRadio,
                onRadioChangeLeft: changeRadio,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: otherRadios.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => changeRadio(otherRadios[index]),
                    child: RadioReaderItem(
                      radioData: otherRadios[index],
                      radioList: otherRadios,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
