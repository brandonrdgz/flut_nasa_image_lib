import 'package:flut_nasa_image_lib/util/list_util.dart';

extension MapCasting on Map {
  Map<T, T2> castMap<T, T2>() {
    Map<T, T2> testMap = this is Map<T, T2> ?
      this as Map<T, T2> :
      map<T, T2>((key, value) => MapEntry<T, T2>(key, value));

    return testMap;
  }
}

extension MapValues on Map {
  T2? getValueFromDotPath<T, T2>(String path) {
    if(this is! Map<String, T> || path.isEmpty) {
      return null;
    }

    List<String> keys = path.split('.');

    dynamic value;

    if(keys.length == 1) {
      value = getValue<String, T, T2>(keys[0]);

      try {
        return value as T2;
      }
      catch(error, _) {
        return null;
      }
    }

    value = getValue<String, T, T>(keys[0]);

    if(value != null) {
      keys.removeAt(0);

      if(value is List && value.has<Map>()) {
        List<Map> mapsList = value.castList<Map>();

        for(Map<String, T> mapInList in mapsList.castMapList<String, T>()) {
          value = mapInList.getValueFromDotPath<T, T2>(keys.join('.'));

          if(value != null) {
            return value;
          }
        }
      }
      else if(value is Map) {
        value = value.castMap<String, T>();

        return value.getValueFromDotPath<T, T2>(keys.join('.'));
      }

      value = null;
    }

    return value;
  }

  T3? getValue<T, T2, T3>(T key) {
    if(containsKey(key)) {
      try {
        return this[key] as T3;
      }
      catch(error, _) {
        return null;
      }
    }

    T3? value;

    for (MapEntry<T, T2> entry in entries.toList().castList<MapEntry<T, T2>>()) {
      if(entry.value is Map) {
        Map map = entry.value as Map;

        value = map.castMap<T, T2>().getValue<T, T2, T3>(key);
      }
      else if(entry.value is List && (entry.value as List).has<Map>()) {
        List list = entry.value as List;

        for(Map mapInList in list.castList<Map>()) {
          value = mapInList.castMap<T, T2>().getValue<T, T2, T3>(key);

          if(value != null) {
            break;
          }
        }
      }

      if(value != null) {
        break;
      }
    }

    return value;
  }
}