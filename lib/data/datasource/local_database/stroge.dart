
abstract class Storage<T> {
  save(T data);

  List<T>? getAll();

  T? get(String key);

  delete(String key);
}
