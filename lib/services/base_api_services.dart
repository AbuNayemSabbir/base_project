import 'package:get/get.dart';

class BaseApiService extends GetConnect {
  BaseApiService() {
    allowAutoSignedCert = true;
    httpClient.baseUrl = 'https://jsonplaceholder.typicode.com';
    httpClient.defaultContentType = 'application/json';
    httpClient.timeout = const Duration(seconds: 30);

    // Add request interceptors, if any
    httpClient.addRequestModifier<dynamic>((request) {
      // For example, add headers
      request.headers['Authorization'] = 'Bearer your_token';
      return request;
    });
  }

  Future<Response> getRequest(String endpoint, {Map<String, dynamic>? query}) async {
    print('GET Request to: $endpoint');
    final response = await get(endpoint, query: query);
    print('Response Status Code: ${response.statusCode}');
    if (response.status.hasError) {
      print('Error: ${response.statusText}');
    } else {
      print('Response Body: ${response.body}');
    }
    return response;
  }
  Future<Response<T>> postRequest<T>(String endpoint, dynamic body, {Map<String, dynamic>? query}) async {
    print('POST Request to: $endpoint with body: $body');
    final response = await post<T>(endpoint, body, query: query);
    print('Response Status Code: ${response.statusCode}');
    return response;
  }

  Future<Response<T>> putRequest<T>(String endpoint, dynamic body, {Map<String, dynamic>? query}) async {
    print('PUT Request to: $endpoint with body: $body');
    final response = await put<T>(endpoint, body, query: query);
    print('Response Status Code: ${response.statusCode}');
    return response;
  }

  Future<Response<T>> deleteRequest<T>(String endpoint, {Map<String, dynamic>? query}) async {
    print('DELETE Request to: $endpoint');
    final response = await delete<T>(endpoint, query: query);
    print('Response Status Code: ${response.statusCode}');
    return response;
  }
}
