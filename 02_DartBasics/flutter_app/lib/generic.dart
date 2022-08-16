abstract class CacheData {
  String getData();
}

abstract class LoadData {
  late String key;
}

class CacheManager<T extends CacheData> {
  void cachData(T data) {
    final result = data.getData();
  }

  String getKey<L extends LoadData>(L loadData) {
    return loadData.key;
  }
}