import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mekuru/core/theme/app_theme.dart';
import 'package:mekuru/features/settings/presentation/providers/settings_provider.dart';
import 'package:mekuru/features/settings/presentation/pages/settings_page.dart';
import 'package:mekuru/features/main/presentation/pages/main_page.dart';
import 'package:mekuru/features/library/presentation/pages/library_page.dart';
import 'package:mekuru/features/explore/presentation/pages/explore_page.dart';
import 'package:mekuru/features/archive/presentation/pages/archive_page.dart';
import 'package:mekuru/features/comic/presentation/pages/comic_details_page.dart';
import 'package:mekuru/features/viewer/presentation/pages/comic_viewer_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('settings');
  await Hive.openBox('tags');

  runApp(const ProviderScope(child: MekuruApp()));
}

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/library',
    routes: [
          GoRoute(
            path: '/details/:providerId/:comicId',
            builder: (context, state) => ComicDetailsPage(
              providerId: state.pathParameters['providerId']!,
              comicId: state.pathParameters['comicId']!,
            ),
          ),
          GoRoute(
            path: '/viewer/:providerId/:comicId/:chapterId',
            builder: (context, state) => ComicViewerPage(
              providerId: state.pathParameters['providerId']!,
              comicId: state.pathParameters['comicId']!,
              chapterId: state.pathParameters['chapterId']!,
            ),
          ),

      ShellRoute(
        builder: (context, state, child) {
          return MainPage(child: child);
        },
        routes: [

          GoRoute(
            path: '/library',
            builder: (context, state) => const LibraryPage(),
          ),
          GoRoute(
            path: '/explore',
            builder: (context, state) => const ExplorePage(),
          ),
          GoRoute(
            path: '/archive',
            builder: (context, state) => const ArchivePage(),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => const SettingsPage(),
          ),
        ],
      ),
    ],
  );
});

class MekuruApp extends ConsumerWidget {
  const MekuruApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final settings = ref.watch(settingsProvider);

    return MaterialApp.router(
      title: 'Mekuru',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settings.themeMode,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
