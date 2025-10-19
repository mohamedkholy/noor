import 'package:flutter/material.dart';
import 'package:noor/features/radio/data/model/radio_data.dart';

class RadioReaderItem extends StatelessWidget {
  final RadioData radioData;
  final List<RadioData> radioList;
  const RadioReaderItem({
    super.key,
    required this.radioData,
    required this.radioList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(2, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,

              image: DecorationImage(
                image: NetworkImage(radioData.img!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            radioData.name!,
            style: const TextStyle(
              fontFamily: "Amiri",
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
