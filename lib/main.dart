import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mekuru/core/theme/app_theme.dart';
import 'package:mekuru/features/settings/presentation/providers/settings_provider.dart';
import 'package:mekuru/features/settings/presentation/pages/settings_page.dart';
import 'package:mekuru/features/main/presentation/pages/main_page.dart';
import 'package:mekuru/features/library/presentation/pages/library_page.dart';
import 'package:mekuru/features/explore/presentation/pages/explore_page.dart';
import 'package:mekuru/features/archive/presentation/pages/archive_page.dart';
import 'package:mekuru/features/comic/presentation/pages/comic_details_page.dart';
import 'package:mekuru/features/viewer/presentation/pages/comic_viewer_page.dart';
import 'package:mekuru/core/notifications/presentation/widgets/global_notification_overlay.dart';
import 'package:mekuru/features/library/domain/services/local_interaction_sync_service.dart';

import 'package:mekuru/features/splash/presentation/pages/splash_page.dart';

import 'package:mekuru/core/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MekuruBootstrap()));
}

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.library,
    routes: [
          GoRoute(
            path: AppRoutes.detailsPath,
            builder: (context, state) => ComicDetailsPage(
              providerId: state.pathParameters['providerId']!,
              comicId: state.pathParameters['comicId']!,
            ),
          ),
          GoRoute(
            path: AppRoutes.viewerPath,
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
            path: AppRoutes.library,
            builder: (context, state) => const LibraryPage(),
          ),
          GoRoute(
            path: AppRoutes.explore,
            builder: (context, state) => const ExplorePage(),
          ),
          GoRoute(
            path: AppRoutes.archive,
            builder: (context, state) => const ArchivePage(),
          ),
          GoRoute(
            path: AppRoutes.settings,
            builder: (context, state) => const SettingsPage(),
          ),
        ],
      ),
    ],
  );
});

class MekuruBootstrap extends StatefulWidget {
  const MekuruBootstrap({super.key});

  @override
  State<MekuruBootstrap> createState() => _MekuruBootstrapState();
}

class _MekuruBootstrapState extends State<MekuruBootstrap> {
  bool _isInitialized = false;

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(
          onInitializationComplete: () {
            if (mounted) {
              setState(() {
                _isInitialized = true;
              });
            }
          },
        ),
      );
    }
    return const MekuruApp();
  }
}

class MekuruApp extends ConsumerWidget {
  const MekuruApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Initialize the sync service globally so it can always listen to events
    ref.watch(localInteractionSyncServiceProvider);
    
    final router = ref.watch(routerProvider);
    final settings = ref.watch(settingsProvider);

    return MaterialApp.router(
      title: 'Mekuru',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settings.themeMode,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return GlobalNotificationOverlay(
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}
