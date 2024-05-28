enum RequestTypes { get, post, put, delete }

class RequestModel {
  final RequestTypes requestType;
  final String url;
  Map<String, dynamic>? headers;
  final dynamic body;

  RequestModel({
    this.requestType = RequestTypes.post,
    required this.url,
    this.headers,
    this.body,
  });
}
