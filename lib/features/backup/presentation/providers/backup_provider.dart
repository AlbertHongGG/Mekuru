import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mekuru/features/backup/data/repositories/backup_repository.dart';
import 'package:mekuru/features/backup/domain/models/backup_archive.dart';

enum BackupStatus { idle, exporting, importing, success, error }

class BackupState {
  final BackupStatus status;
  final String? message;
  
  const BackupState({this.status = BackupStatus.idle, this.message});
}

class BackupNotifier extends Notifier<BackupState> {
  @override
  BackupState build() => const BackupState();

  Future<void> exportBackup() async {
    state = const BackupState(status: BackupStatus.exporting);
    try {
      final repo = ref.read(backupRepositoryProvider);
      final archive = await repo.createSnapshot();

      final compressedBytes = await Isolate.run(() {
        final jsonString = jsonEncode(archive.toJson());
        final bytes = utf8.encode(jsonString);
        return gzip.encode(bytes);
      });

      final dateStr = DateTime.now().toIso8601String().replaceAll(':', '').replaceAll('-', '').split('.').first;
      final fileName = 'mekuru_backup_$dateStr.mekurubak';

      final outputFileUri = await FilePicker.saveFile(
        dialogTitle: '匯出備份檔案',
        fileName: fileName,
        type: FileType.custom,
        allowedExtensions: ['mekurubak'],
        bytes: Uint8List.fromList(compressedBytes),
      );

      if (outputFileUri == null) {
        state = const BackupState(status: BackupStatus.idle);
        return;
      }
      
      if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        final file = File(outputFileUri.toFilePath());
        await file.writeAsBytes(compressedBytes);
      }

      state = const BackupState(status: BackupStatus.success, message: '備份匯出成功');
    } catch (e) {
      state = BackupState(status: BackupStatus.error, message: '備份失敗: ');
    }
  }

  Future<void> importBackup() async {
    state = const BackupState(status: BackupStatus.importing);
    try {
      final files = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['mekurubak', 'json', 'gz'],
      );

      if (files.isEmpty) {
        state = const BackupState(status: BackupStatus.idle);
        return;
      }

      final fileBytes = await files.first.readAsBytes();

      final archive = await Isolate.run(() {
        List<int> decodedBytes;
        try {
          decodedBytes = gzip.decode(fileBytes);
        } catch (_) {
          decodedBytes = fileBytes;
        }
        
        final jsonString = utf8.decode(decodedBytes);
        final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
        return BackupArchive.fromJson(jsonMap);
      });

      final repo = ref.read(backupRepositoryProvider);
      await repo.restoreSnapshot(archive);

      state = const BackupState(status: BackupStatus.success, message: '備份還原成功');
    } catch (e) {
      state = BackupState(status: BackupStatus.error, message: '還原失敗: ');
    }
  }
}

final backupProvider = NotifierProvider<BackupNotifier, BackupState>(() {
  return BackupNotifier();
});
