import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_check_result.freezed.dart';

@freezed
abstract class UpdateCheckResult with _$UpdateCheckResult {
  const factory UpdateCheckResult({
    required bool hasNew,
    required int newTotal,
    DateTime? newSourceUpdatedAt,
    String? newLatestTitle,
  }) = _UpdateCheckResult;
}
