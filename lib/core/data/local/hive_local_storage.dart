import 'package:hive_flutter/hive_flutter.dart';
import 'package:mekuru/core/data/local/i_local_storage.dart';

class HiveLocalStorage<T> implements ILocalStorage<T> {
  final Box<T> _box;

  HiveLocalStorage(this._box);

  @override
  T? get(String id) {
    return _box.get(id);
  }

  @override
  List<T> getAll() {
    return _box.values.toList();
  }

  @override
  List<String> get keys {
    return _box.keys.map((e) => e.toString()).toList();
  }

  @override
  Future<void> put(String id, T item) async {
    await _box.put(id, item);
  }

  @override
  Future<void> delete(String id) async {
    await _box.delete(id);
  }

  @override
  Future<void> deleteAll(List<String> ids) async {
    await _box.deleteAll(ids);
  }

  @override
  Future<void> clear() async {
    await _box.clear();
  }

  @override
  Stream<T?> watch(String id) async* {
    yield _box.get(id);
    await for (final event in _box.watch(key: id)) {
      yield event.value as T?;
    }
  }

  @override
  Stream<void> watchAll() {
    return _box.watch().map((_) {});
  }
}
