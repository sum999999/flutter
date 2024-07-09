import 'package:dio/dio.dart';

class NetworkService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com',
    connectTimeout: const Duration(milliseconds: 5000),
    receiveTimeout: const Duration(milliseconds: 3000),
  ));

  NetworkService() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // 在请求头中添加 token 或其他信息
        options.headers["Authorization"] = "Bearer your_token";
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // 处理响应数据
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        // 处理错误
        if (e.type == DioExceptionType.connectionTimeout) {
          // 连接超时
          print("Connection Timeout");
        } else if (e.type == DioExceptionType.receiveTimeout) {
          // 接收超时
          print("Receive Timeout");
        } else if (e.response != null) {
          // 服务器返回的错误状态码
          switch (e.response?.statusCode) {
            case 400:
              print("Bad Request");
              break;
            case 401:
              print("Unauthorized");
              break;
            case 403:
              print("Forbidden");
              break;
            case 404:
              print("Not Found");
              break;
            case 500:
              print("Internal Server Error");
              break;
            default:
              print("Unknown Error");
          }
        } else {
          // 其他错误
          print(e.message);
        }
        return handler.next(e);
      },
    ));
  }

  Future<dynamic> getRequest(String endpoint) async {
    try {
      Response response = await _dio.get(endpoint);
      return response.data;
    } catch (e) {
      print("Get Request Error: $e");
      return null;
    }
  }

  Future<dynamic> postRequest(String endpoint, Map<String, dynamic> data) async {
    try {
      Response response = await _dio.post(endpoint, data: data);
      return response.data;
    } catch (e) {
      print("Post Request Error: $e");
      return null;
    }
  }
}