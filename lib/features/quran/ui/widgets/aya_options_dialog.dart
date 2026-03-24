import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/models/bookmark.dart';
import 'package:noor/core/routing/my_routes.dart';
import 'package:noor/core/shared_preferences/shared_preferences_settings_service.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/features/quran/logic/quran_cubit/quran_cubit.dart';
import 'package:noor/features/quran/ui/widgets/aya_options_button.dart';
import 'package:noor/generated/l10n.dart';

class AyaBottomSheet extends StatefulWidget {
  final int suraNumber;
  final int ayaNumber;
  final int pageNumber;
  final int juzNumber;
  final String ayaText;
  final VoidCallback? onPlaySound;
  final String fontFamily;

  const AyaBottomSheet({
    super.key,
    required this.suraNumber,
    required this.ayaNumber,
    required this.pageNumber,
    required this.juzNumber,
    required this.ayaText,
    this.onPlaySound,
    required this.fontFamily,
  });

  @override
  State<AyaBottomSheet> createState() => _AyaBottomSheetState();
}

class _AyaBottomSheetState extends State<AyaBottomSheet>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeIn;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 420),
    );
    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final bgColor = isDark ? const Color(0xFF1A1A2E) : const Color(0xFFF8F5EE);
    final surfaceColor = isDark
        ? const Color(0xFF16213E)
        : const Color(0xFFFFFFFF);
    const accentGold = Color(0xFFC9A84C);
    const accentGreen = Color(0xFF2E7D5E);
    final textPrimary = isDark
        ? const Color(0xFFF0EAD6)
        : const Color(0xFF2C2C2C);
    final textSecondary = isDark
        ? const Color(0xFF9A8F7A)
        : const Color(0xFF7A7265);

    return FadeTransition(
      opacity: _fadeIn,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 30,
              spreadRadius: 5,
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: accentGold.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: MyColors.secondary.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: MyColors.secondary.withValues(alpha: 0.4),
                    ),
                  ),
                  child: Text(
                    '${S.of(context).aya} ${widget.ayaNumber} - ${S.of(context).surah} ${widget.suraNumber}',
                    style: const TextStyle(
                      fontFamily: 'Amiri',
                      fontSize: 16,
                      color: Color(0xFF7A6000),
                      fontWeight: FontWeight.w600,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: surfaceColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: accentGold.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Text(
                    widget.ayaText,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 22,
                      height: 2.0,
                      fontFamily: widget.fontFamily,
                      color: textPrimary,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: accentGold.withValues(alpha: 0.2),
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        S.of(context).options,
                        style: TextStyle(
                          fontSize: 12,
                          color: textSecondary,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: accentGold.withValues(alpha: 0.2),
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: AyaOptionsButton(
                        icon: Icons.play_circle_fill_rounded,
                        label: S.of(context).playAya,
                        sublabel: S.of(context).playAyaSublabel,
                        iconColor: accentGreen,
                        bgColor: accentGreen.withValues(alpha: 0.1),
                        borderColor: accentGreen.withValues(alpha: 0.3),
                        textColor: textPrimary,
                        subtextColor: textSecondary,
                        onTap: () {
                          Navigator.of(context).pop();
                          widget.onPlaySound?.call();
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Show Tafsir
                    Expanded(
                      child: AyaOptionsButton(
                        icon: Icons.auto_stories_rounded,
                        label: S.of(context).tafsir,
                        sublabel: S.of(context).tafsirSublabel,
                        iconColor: accentGold,
                        bgColor: accentGold.withValues(alpha: 0.1),
                        borderColor: accentGold.withValues(alpha: 0.3),
                        textColor: textPrimary,
                        subtextColor: textSecondary,
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pushNamed(
                            MyRoutes.tafsir,
                            arguments: (widget.suraNumber, widget.ayaNumber),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AyaOptionsButton(
                        icon: Icons.bookmark_add_rounded,
                        label: S.of(context).bookmark,
                        sublabel: S.of(context).bookmarkSublabel,
                        iconColor: Colors.red,
                        bgColor: Colors.red.withValues(alpha: 0.1),
                        borderColor: Colors.red.withValues(alpha: 0.3),
                        textColor: textPrimary,
                        subtextColor: textSecondary,
                        onTap: () {
                          final bookmark = Bookmark(
                            surahNumber: widget.suraNumber,
                            ayaNumber: widget.ayaNumber,
                            pageNumber: widget.pageNumber,
                            juzNumber: widget.juzNumber,
                          );
                          SharedPreferencesSettingsService().saveBookMark(
                            bookmark,
                          );
                          context.read<QuranCubit>().bookMarkNotifier.value =
                              bookmark;
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
