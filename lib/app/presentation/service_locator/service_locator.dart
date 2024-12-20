class ServiceLocator {
  //Singleton
  //Contructor privado clase no instanciada fuera del archivo
  //Map que permite guardar otros singleton
  ServiceLocator._();
  static final _instance = ServiceLocator._();

  static ServiceLocator get instance => _instance;

  final _data = <String, dynamic>{};

  String _getKey(Type type, String? tag) {
    return '${type.toString()}${tag ?? ''}';
  }

  //Datos genericos
  T put<T>(
    T value, {
    String? tag,
  }) {
    _data[_getKey(T, tag)] = value;
    return value;
  }

  T find<T>({String? tag}) {
    final key = _getKey(T, tag);
    assert(_data.containsKey(key), '$key not found');
    return _data[key]!;
  }

  void clear(){
    _data.clear();
  }
}
