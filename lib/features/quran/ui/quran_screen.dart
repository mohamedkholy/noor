import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/routing/my_routes.dart';
import 'package:noor/core/shared_preferences/shared_preferences_settings_service.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/core/theming/my_text_styles.dart';
import 'package:noor/features/quran/logic/quran_cubit/quran_cubit.dart';
import 'package:noor/features/quran/logic/quran_cubit/quran_state.dart';
import 'package:noor/features/quran/ui/chapters_screen.dart';
import 'package:noor/features/quran/ui/surahs_screen.dart';
import 'package:noor/features/quran/ui/widgets/search_result_item.dart';
import 'package:noor/generated/l10n.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  late final QuranCubit _quranCubit = context.read<QuranCubit>();
  bool _isSearching = false;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _quranCubit.getSuras();
  }

  @override
  void dispose() {
    _quranCubit.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    _quranCubit.searchVerses(value);
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        _searchController.clear();
        _quranCubit.searchVerses('');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: !_isSearching
            ? Text(S.current.quran, style: MyTextStyles.appBarTextStyle)
            : TextField(
                controller: _searchController,
                cursorColor: Colors.white,
                autofocus: true,
                style: const TextStyle(color: Colors.white, fontSize: 18),
                decoration: InputDecoration(
                  hintText: S.current.search,
                  hintStyle: const TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                ),
                onChanged: _onSearchChanged,
              ),
        actions: [
          if (!_isSearching &&
              SharedPreferencesSettingsService().getBookMark() != null)
            IconButton(
              onPressed: () {
                final bookmark = SharedPreferencesSettingsService()
                    .getBookMark();
                Navigator.pushNamed(
                  context,
                  MyRoutes.reading,
                  arguments: {
                    'surahNumber': bookmark!.surahNumber,
                    'ayaNumber': bookmark.ayaNumber,
                    'juzNumber': bookmark.juzNumber,
                    'pageNumber': bookmark.pageNumber,
                  },
                );
              },
              icon: const Icon(Icons.bookmark, color: Colors.white),
            ),
          IconButton(
            icon: Icon(
              _isSearching ? Icons.close : Icons.search,
              color: Colors.white,
            ),
            onPressed: _toggleSearch,
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: BlocBuilder<QuranCubit, QuranState>(
              builder: (context, state) {
                if (state is QuranSearchLoaded) {
                  if (state.results.isEmpty) {
                    return Center(
                      child: Text(
                        _isSearching ? S.current.noResults : '',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  }
                  return ListView.separated(
                    itemCount: state.results.length,
                    separatorBuilder: (_, _) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final verse = state.results[index];
                      return SearchResultItem(verse: verse);
                    },
                  );
                }
                if (state is SurahsLoaded) {
                  return DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        TabBar(
                          indicatorColor: MyColors.primary,
                          labelColor: MyColors.primary,
                          unselectedLabelColor: Colors.grey,
                          labelStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          tabs: [
                            Tab(text: S.current.surah, height: 60),
                            Tab(text: S.current.juz, height: 60),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: TabBarView(
                            children: [
                              SurahsScreen(surahs: state.surahs),
                              ChaptersScreen(verses: state.verses),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(color: MyColors.primary),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
