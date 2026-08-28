class AppRoutes {
  // Main tabs
  static const String library = '/library';
  static const String explore = '/explore';
  static const String archive = '/archive';
  static const String settings = '/settings';

  // Route paths for Router configuration
  static const String detailsPath = '/details/:providerId/:comicId';
  static const String viewerPath = '/viewer/:providerId/:comicId/:chapterId';

  // Helper methods for dynamic path generation
  static String details(String providerId, String comicId) => '/details/$providerId/$comicId';
  static String viewer(String providerId, String comicId, String chapterId) => '/viewer/$providerId/$comicId/$chapterId';
}
