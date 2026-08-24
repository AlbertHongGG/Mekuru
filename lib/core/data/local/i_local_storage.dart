abstract class ILocalStorage<T> {
  T? get(String id);
  List<T> getAll();
  List<String> get keys;
  Future<void> put(String id, T item);
  Future<void> delete(String id);
  Future<void> deleteAll(List<String> ids);
  Future<void> clear();
  Stream<T?> watch(String id);
  Stream<void> watchAll();
}
