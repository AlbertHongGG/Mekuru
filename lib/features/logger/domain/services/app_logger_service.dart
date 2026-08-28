import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/features/logger/domain/models/log_entry.dart';
import 'package:mekuru/features/logger/domain/repositories/i_logger_repository.dart';
import 'package:mekuru/features/settings/presentation/providers/settings_provider.dart';
import 'package:mekuru/features/logger/presentation/providers/logger_provider.dart';
import 'package:uuid/uuid.dart';

abstract class IAppLogger {
  void logApi(ApiLogEntry entry);
  void logSystemEvent(String eventType, Map<String, dynamic> data);
}

class AppLoggerService implements IAppLogger {
  final ILoggerRepository _repository;
  final Ref _ref;

  AppLoggerService(this._repository, this._ref);

  @override
  void logApi(ApiLogEntry entry) {
    // Read the latest state synchronously
    final settings = _ref.read(settingsProvider);
    if (!settings.enableApiLogging) {
      return;
    }
    
    _repository.log(entry);
  }

  @override
  void logSystemEvent(String eventType, Map<String, dynamic> data) {
    // Read the latest state synchronously
    final settings = _ref.read(settingsProvider);
    if (!settings.enableSystemLogging) {
      return;
    }

    final entry = LogEntry.system(
      id: const Uuid().v4(),
      timestamp: DateTime.now(),
      eventType: eventType,
      data: data,
    );
    
    _repository.log(entry);
  }
}

final appLoggerProvider = Provider<IAppLogger>((ref) {
  return AppLoggerService(
    ref.watch(loggerRepositoryProvider),
    ref,
  );
});
