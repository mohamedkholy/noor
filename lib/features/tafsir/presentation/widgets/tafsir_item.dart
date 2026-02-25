import 'package:flutter/material.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/features/tafsir/data/models/tafsir.dart';

class TafsirItem extends StatelessWidget {
  final Tafsir tafsir;

  const TafsirItem({super.key, required this.tafsir});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(2, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: MyColors.primary.withValues(alpha: 0.1),
            ),
            child: const Icon(
              Icons.menu_book_rounded,
              color: MyColors.primary,
              size: 22,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tafsir.name ?? '',
                  style: const TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                if (tafsir.author != null && tafsir.author!.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    tafsir.author!,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 10),
          const Icon(
            Icons.arrow_forward_ios,
            color: MyColors.primary,
            size: 15,
          ),
        ],
      ),
    );
  }
}
