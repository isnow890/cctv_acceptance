import 'package:cctv_acceptance/src/data.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();

  dio.interceptors.add(CustomInterceptor(ref: ref));
  return dio;
});

class CustomInterceptor extends Interceptor {
  final Ref ref;

  CustomInterceptor({required this.ref});

  // 1)요청을 보낼때
  // 로그로 사용할 수도 있음.
  // 요청을 보내기 전의 상태임.
  //만약에 요청의 header에 accessToken : true라는 값이 있다면
  //실제 토큰을 가져와서 authorization : bearer 의 값을 변경함.
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print('[REQ] [${options.method}] ${options.uri}');
    print('[REQ] ${options.data}');
    //acessToken

    options.headers.addAll({
      'Content-Type': 'application/json',
      'Accept': '*/*',
    'Access-Control-Allow-Origin' :'*',

    'authorization': 'Bearer aGFoYWhvaG8='
    });

    // TODO: implement onRequest
    return super.onRequest(options, handler);
  }

  // 2)응답을 받을때
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        '[RES] [${response.requestOptions.method}] ${response.requestOptions.uri}');

    // TODO: implement onResponse
    return super.onResponse(response, handler);
  }

// 3)에러가 났을때
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    //401 에러가 났을때 (status code)
    //토큰을 재발급 받는 시도를 하고 토큰이 재발급되면
    //다시 새로운 토큰으로 요청.

    print(
        '[ERR] [${err.requestOptions.method}] ${err.requestOptions.uri} ${err.message} ${err.stackTrace.toString()}');

    // TODO: implement onError
    return super.onError(err, handler);
  }
}
