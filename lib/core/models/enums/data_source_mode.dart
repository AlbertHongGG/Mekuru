enum DataSourceMode {
  source,
  db,
}

extension DataSourceModeExtension on DataSourceMode {
  String get label {
    switch (this) {
      case DataSourceMode.source:
        return '來源端 (Provider)';
      case DataSourceMode.db:
        return '資料庫 (DB Server)';
    }
  }

  static DataSourceMode fromString(String value) {
    return DataSourceMode.values.firstWhere(
      (e) => e.name == value,
      orElse: () => DataSourceMode.source,
    );
  }
}
