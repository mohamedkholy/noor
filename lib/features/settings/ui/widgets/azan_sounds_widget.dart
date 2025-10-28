import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/core/widgets/decorated_container.dart';
import 'package:noor/features/settings/logic/settings_cubit.dart';
import 'package:noor/generated/l10n.dart';

class AzanSoundsWidget extends StatefulWidget {
  final Function(String) onSoundChanged;
  const AzanSoundsWidget({super.key, required this.onSoundChanged});

  @override
  State<AzanSoundsWidget> createState() => _AzanSoundsWidgetState();
}

class _AzanSoundsWidgetState extends State<AzanSoundsWidget> {
  final AudioPlayer _player = AudioPlayer();
  Timer? _timer;
  late String sound = context.read<SettingsCubit>().getAzanSound();
  late String currentAsset = sound;

  final List<(String, String, String)> azanSounds = [
    ("Makkah - Masjid al-Haram", "مكة - المسجد الحرام", "azan_makkah"),
    ("Madinah - Masjid an-Nabawi", "المدينة - المسجد النبوي", "azan_madinah"),
    (
      "Sheikh Ali Ahmed Mulla (Makkah Muadhin)",
      "الشيخ علي أحمد ملا - مؤذن مكة",
      "azan_ali_mulla",
    ),
    ("Sheikh Nasser Al-Qatami", "الشيخ ناصر القطامي", "azan_nasser_qatami"),
    (
      "Sheikh Mishary Rashid Alafasy",
      "الشيخ مشاري راشد العفاسي",
      "azan_mishary",
    ),
    (
      "Sheikh Abdul Basit Abdus Samad",
      "الشيخ عبد الباسط عبد الصمد",
      "azan_abdulbasit",
    ),
    ("Sheikh Saad Al-Ghamdi", "الشيخ سعد الغامدي", "azan_saadalghamdi"),
    ("Sheikh Maher Al-Muaiqly", "الشيخ ماهر المعيقلي", "azan_maher"),
    ("Egyptian Style - Cairo", "الأذان المصري - القاهرة", "azan_cairo"),
  ];

  @override
  void dispose() {
    _player.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              S.of(context).azansounds,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 5),
            GestureDetector(
              onTap: () {
                _play(currentAsset);
              },
              child: const Icon(
                Icons.play_arrow,
                color: MyColors.primary,
                size: 28,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        DecoratedContainer(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white),
                    ),
                    child: DropdownButton(
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "cairo",
                      ),
                      dropdownColor: Colors.black,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                      isExpanded: true,
                      value: currentAsset,
                      items: azanSounds
                          .map(
                            (e) => DropdownMenuItem(
                              value: e.$3,
                              child: Text(
                                Localizations.localeOf(context).languageCode ==
                                        'ar'
                                    ? e.$2
                                    : e.$1,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            currentAsset = value;
                          });
                          _player.stop();
                          _play(currentAsset);
                          widget.onSoundChanged(value);
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _play(String assetName) async {
    await _player.stop();
    await _player.setAsset("assets/sounds/$assetName.ogg");
    _player.play();
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 10), () {
      _player.stop();
    });
  }
}
