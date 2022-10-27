import 'package:flut_nasa_image_lib/app/utils/collections/map_util.dart';

extension ListCasting on List<dynamic> {
  List<T> castList<T>() {
    return map((dynamic element) => element as T).toList();
  }

  List<Map<T, T2>> castMapList<T, T2>() {
    if(has<Map<dynamic, dynamic>>()) {
      return map<Map<T, T2>>((dynamic map) {
        return (map as Map).castMap<T, T2>();
      }).toList();
    }
    else {
      return [];
    }
  }
}

extension ListValues on List<dynamic> {
  bool has<T>() {
    return every((dynamic element) => element is T);
  }
}