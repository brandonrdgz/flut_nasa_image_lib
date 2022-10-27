extension MapCasting on Map<dynamic, dynamic> {
  Map<T, T2> castMap<T, T2>() {
    Map<T, T2> testMap = this is Map<T, T2> ?
      this as Map<T, T2> :
      map<T, T2>((dynamic key, dynamic value) => MapEntry<T, T2>(key as T, value as T2));

    return testMap;
  }
}