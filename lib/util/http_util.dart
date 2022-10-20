import 'package:http/http.dart' as http;

enum HttpMethod {
  get,
  post,
  put,
  patch,
  delete,
}

class HttpUtil {
  static final Map<HttpMethod, Future<http.Response> Function(http.Client, Uri)> _httpRequests = {
    HttpMethod.get: (client, uri) => client.get(uri),
    HttpMethod.post: (client, uri) => client.post(uri),
    HttpMethod.put: (client, uri) => client.put(uri),
    HttpMethod.patch: (client, uri) => client.patch(uri),
    HttpMethod.delete: (client, uri) => client.delete(uri),
  };

  static Future<http.Response> makeRequest({
    required http.Client client,
    required HttpMethod httpMethod,
    required Uri uri,
  }) async {
    Future<http.Response> Function(http.Client, Uri) requestFunction = 
      _httpRequests[httpMethod] ??
      (client, uri) => client.get(uri);

    return await requestFunction(client, uri);
  }
}