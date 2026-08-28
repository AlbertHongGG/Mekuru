
abstract class IArchiveTaskManager {
  Future<void> enqueueTask(String providerId, String comicId);
  Future<void> pauseTask(String providerId, String comicId);
  Future<void> resumeTask(String providerId, String comicId);
  /// Cancels the task in the queue and DB, but does NOT wipe completed physical files.
  Future<void> cancelTask(String providerId, String comicId);
}
