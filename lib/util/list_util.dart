import 'package:flut_nasa_image_lib/util/map_util.dart';

extension ListCasting on List {
  List<T> castList<T>() {
    return map((element) => element as T).toList();
  }

  List<Map<T, T2>> castMapList<T, T2>() {
    if(has<Map>()) {
      return map<Map<T, T2>>((map) {
        return (map as Map).castMap<T, T2>();
      }).toList();
    }
    else {
      return [];
    }
  }
}

extension ListValues on List {
  bool has<T>() {
    return every((element) => element is T);
  }
}