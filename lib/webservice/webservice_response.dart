class WebserviceResponse {
  int statusCode;
  Map<dynamic, dynamic> headers;
  Map<dynamic, dynamic> responseBody;
  bool isError;
  String? errorResponse;
  WebserviceResponse(this.statusCode, this.headers, this.responseBody,
      this.isError, this.errorResponse);
}
